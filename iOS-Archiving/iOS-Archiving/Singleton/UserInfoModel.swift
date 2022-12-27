//
//  UserInfoModel.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/27.
//

import Foundation

class UserInfo {
  static let shared = UserInfo()
  
  var id: String?
  var password: String?
  var name: String?
  
  private init() { }
}
