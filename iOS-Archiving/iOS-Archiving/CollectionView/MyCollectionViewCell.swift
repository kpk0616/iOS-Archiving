//
//  MyCollectionViewCell.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/21.
//

import UIKit
import SnapKit
import Then

final class MyCollectionViewCell: UICollectionViewCell {
  
  static var id: String {
    return NSStringFromClass(Self.self).components(separatedBy: ".").last!
  }
  
  var dataLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    contentView.backgroundColor = .systemGray2
    dataLabel = UILabel()
    dataLabel.font = UIFont.systemFont(ofSize: 32)
    dataLabel.textColor = .label
    dataLabel.textAlignment = .center
    
    contentView.addSubview(dataLabel)
    dataLabel.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
}
