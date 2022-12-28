//
//  ClosureViewController.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/28.
//

import UIKit

class ClosureViewController: UIViewController {
  
  let closure = { (name: String) -> String in
    return "Hello, \(name)"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(closure("의서"))
  }
}
