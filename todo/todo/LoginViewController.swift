//
//  LoginViewController.swift
//  todo
//
//  Created by RAMIL LIM on 6/16/18.
//  Copyright © 2018 LimEntertainment. All rights reserved.
//

import UIKit
import Auth0

class LoginViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    checkCredentials()
  }

  func checkCredentials() {
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())

    credentialsManager.credentials { error, credentials in
      guard error == nil, let credentials = credentials else {
        Auth0
          .webAuth()
          .scope("openid profile offline_access")
          .audience("https://spinningfiction.auth0.com/userinfo")
          .start {
            switch $0 {
            case .failure(let error):
              // Handle the error
              print("Error: \(error)")
            case .success(let credentials):
              credentialsManager.store(credentials: credentials)
              print("it was a success")
              self.dismiss(animated: false, completion: nil)
            }
        }

        return
      }

      // Valid credentials, you can access the token properties such as `idToken`, `accessToken`.
      self.dismiss(animated: false, completion: nil)
    }
  }
}
