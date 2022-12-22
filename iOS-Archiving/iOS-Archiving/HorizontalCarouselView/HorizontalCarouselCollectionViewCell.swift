//
//  HorizontalCarouselCollectionViewCell.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/22.
//

import UIKit
import SnapKit
import Then

class HorizontalCarouselCollectionViewCell: UICollectionViewCell {
    
    static var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    var model: String? { didSet { bind() } }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalCarouselCollectionViewCell {
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func configure() {
        backgroundColor = .placeholderText
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func bind() {
        titleLabel.text = model
    }
}
