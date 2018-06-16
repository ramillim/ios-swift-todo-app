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
    if let taskText = task.text {
      todoTableViewController.createTodo(text: taskText)
      navigationController?.popViewController(animated: true)
    }
  }
}
