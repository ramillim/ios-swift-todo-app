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
  @IBOutlet weak var taskTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    taskTextField.becomeFirstResponder()
  }

  @IBAction func tapSave(_ sender: UIBarButtonItem) {
    if let text = taskTextField.text {
      todoTableViewController.createTodo(text: text)
      navigationController?.popViewController(animated: true)
    }
  }
}
