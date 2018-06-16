//
//  UpdateTodoViewController.swift
//  todo
//
//  Created by RAMIL LIM on 6/16/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import UIKit

class UpdateTodoViewController: UIViewController {

  @IBOutlet weak var taskTextField: UITextField!

  var todoTableViewController = TodoTableViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    taskTextField.text = todoTableViewController.selectedTodo?.task
    taskTextField.becomeFirstResponder()
  }

  @IBAction func tapSave(_ sender: UIBarButtonItem) {
    if let text = taskTextField.text {
      let todo = todoTableViewController.selectedTodo
      todoTableViewController.updateTodo(todo: todo!, text: text)
      navigationController?.popViewController(animated: true)
    }
  }
}
