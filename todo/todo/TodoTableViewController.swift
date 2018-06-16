//
//  TodoTableViewController.swift
//  todo
//
//  Created by RAMIL LIM on 6/15/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

  var todos : [Todo] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    todos = Todo.seedData()
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
    let createTodoView = segue.destination as! CreateTodoViewController
    createTodoView.todoTableViewController = self
  }

  func addTodo(todo: Todo) {
    todos.append(todo)
    tableView.reloadData()
  }
}
