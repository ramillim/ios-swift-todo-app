//
//  TodoTableViewController.swift
//  todo
//
//  Created by RAMIL LIM on 6/15/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

  var todos : [TodoCoreData] = []
  var selectedTodo : TodoCoreData?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    fetchTodos()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
    let todo = todos[indexPath.row]
    cell.textLabel?.text = todo.task
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "createSegue" {
      let destinationView = segue.destination as! CreateTodoViewController
      destinationView.todoTableViewController = self
    } else if segue.identifier == "updateSegue" {
      let destinationView = segue.destination as! UpdateTodoViewController
      destinationView.todoTableViewController = self
    }
  }

  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let complete = completeAction(at: indexPath)
    return UISwipeActionsConfiguration(actions: [complete])
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedTodo = todos[indexPath.row]
//    self.performSegue(withIdentifier: "updateSegue", sender: self)
  }

  // MARK: - Swipe Actions

  func completeAction(at indexPath: IndexPath) -> UIContextualAction {
    let action = UIContextualAction(style: .destructive, title: "Complete") { (action, view, completion) in
      self.completeTodo(at: indexPath)
      completion(true)
    }
    action.backgroundColor = .red
    return action
  }

  // MARK: - Todo Collection State Functions

  func fetchTodos() {
    if let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

      if let todosCoreData = try? viewContext.fetch(TodoCoreData.fetchRequest()) as? [TodoCoreData] {
        if let fetchedTodos = todosCoreData {
          todos = fetchedTodos
          tableView.reloadData()
        }
      }
    }
  }

  func createTodo(text: String) {
    if let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      let newTodo = TodoCoreData(entity: TodoCoreData.entity(), insertInto: viewContext)
      newTodo.task = text
      newTodo.isComplete = false
      try? viewContext.save()
      tableView.reloadData()
    }
  }

  func updateTodo(todo: TodoCoreData, text: String) {
    if let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      todo.task = text
      try? viewContext.save()
      tableView.reloadData()
    }
  }

  func completeTodo(at indexPath: IndexPath) {
    if let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      viewContext.delete(self.todos[indexPath.row])
      do {
        try viewContext.save()
        todos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
  }
}
