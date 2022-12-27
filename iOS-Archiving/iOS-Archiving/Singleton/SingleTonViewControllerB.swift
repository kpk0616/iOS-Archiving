//
//  SingleTonViewControllerB.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/27.
//

import UIKit

final class SingleTonViewControllerB: UIViewController {
  
  let userInfo = UserInfo.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private func setName() {
    userInfo.name = "의서"
    print(userInfo.id)
    print(userInfo.password)
  }
}
