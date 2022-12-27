//
//  SingleTonViewControllerA.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/27.
//

import UIKit

final class SingleTonViewControllerA: UIViewController {
  
  let userInfo = UserInfo.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setId()
  }
}

extension SingleTonViewControllerA {
  private func setId() {
    userInfo.id = "epark"
  }
}
