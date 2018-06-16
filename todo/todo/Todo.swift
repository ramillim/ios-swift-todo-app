//
//  Todo.swift
//  todo
//
//  Created by RAMIL LIM on 6/15/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import Foundation

class Todo
{
  var task: String
  var isComplete: Bool

  public init(task: String)
  {
    self.task = task
    self.isComplete = false
  }
}

extension Todo
{
  public class func seedData() -> [Todo]
  {
    return [
      Todo(task: "Buy groceries"),
      Todo(task: "Take out the trash"),
      Todo(task: "Get a job")
    ]
  }
}
