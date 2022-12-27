//
//  SingleTonViewControllerA.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/27.
//

import UIKit
import Then
import SnapKit

final class SingleTonViewControllerA: UIViewController {
  private let userInfo = UserInfo.shared
  
  private lazy var navigationButton = UIButton().then {
    $0.setTitle("다음 화면으로 이동", for: .normal)
    $0.backgroundColor = .black
    $0.addTarget(self, action: #selector(pushToB), for: .touchUpInside)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setId()
    setLayout()
  }
}

extension SingleTonViewControllerA {
  private func setId() {
    userInfo.id = "epark"
    print(userInfo.id)
  }
  
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubview(navigationButton)
    navigationButton.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.height.equalTo(50)
      $0.width.equalTo(200)
    }
  }
  
  @objc private func pushToB() {
    let singleTonB = SingleTonViewControllerB()
    self.navigationController?.pushViewController(singleTonB, animated: true)
  }
}
