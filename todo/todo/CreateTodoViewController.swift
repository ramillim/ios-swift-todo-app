//
//  CreateTodoViewController.swift
//  todo
//
//  Created by RAMIL LIM on 6/15/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {

  var todoTableViewController = TodoTableViewController()
  @IBOutlet weak var task: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func tapSave(_ sender: UIBarButtonItem) {
    let newTodo = Todo(task: task.text!)
    todoTableViewController.addTodo(todo: newTodo)
    navigationController?.popViewController(animated: true)
  }
}
