//
//  SingleTonViewControllerB.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/27.
//

import UIKit

final class SingleTonViewControllerB: UIViewController {
  private let userInfo = UserInfo.shared

  override func viewDidLoad() {
    super.viewDidLoad()
    setName()
    setLayout()
  }
}

extension SingleTonViewControllerB {
  private func setName() {
    userInfo.name = "의서"
    print(userInfo.id!)
    print(userInfo.name!)
  }
  
  private func setLayout() {
    view.backgroundColor = .white
  }
}
