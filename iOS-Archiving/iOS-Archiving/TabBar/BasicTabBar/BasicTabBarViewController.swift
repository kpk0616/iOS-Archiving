//
//  BasicTabBarViewController.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/28.
//

import UIKit

final class BasicTabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    setViewControllers()
  }
}

extension BasicTabBarViewController {
  private func setViewControllers() {
    let firstViewController = FirstBasicTabBarViewController().then {
      $0.title = "first"
    }
    let secondViewController = SecondBasicTabBarViewController().then {
      $0.title = "second"
    }
    let ThirdViewController = ThirdBasicTabBarViewController().then {
      $0.title = "third"
    }
    let fourthViewController = FourthBasicTabBarViewController().then {
      $0.title = "fourth"
    }
    let fifthViewController = FifthBasicTabBarViewController().then {
      $0.title = "fifth"
    }
    
    self.setViewControllers([
      firstViewController,
      secondViewController,
      ThirdViewController,
      fourthViewController,
      fifthViewController], animated: true)
  }
}

final class FirstBasicTabBarViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemBrown
  }
}

final class SecondBasicTabBarViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemOrange
  }
}

final class ThirdBasicTabBarViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemYellow
  }
}

final class FourthBasicTabBarViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemGreen
  }
}

final class FifthBasicTabBarViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemGray2
  }
}
