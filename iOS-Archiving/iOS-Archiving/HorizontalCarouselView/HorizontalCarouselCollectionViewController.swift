//
//  HorizontalCarouselCollectionViewController.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/22.
//

import UIKit
import SnapKit
import Then

private let reuseIdentifier = "Cell"

final class HorizontalCarouselCollectionViewController: UIViewController {
    
    var dataSource: [String] = []
    
    lazy var horizontalCarouselCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 50
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupDataSource()
        addSubviews()
        configure()
        registerCell()
    }
}

extension HorizontalCarouselCollectionViewController {
    private func configure() {
        
        horizontalCarouselCollectionView.backgroundColor = .brown
        horizontalCarouselCollectionView.snp.makeConstraints {
            $0.center.leading.trailing.equalToSuperview()
            $0.height.equalTo(320)
        }
    }
    
    private func setupDataSource() {
        for i in 0...10 {
            dataSource += ["\(i)"]
        }
    }
    
    private func addSubviews() {
        view.addSubview(horizontalCarouselCollectionView)
    }
    
    private func setupDelegate() {
        horizontalCarouselCollectionView.delegate = self
        horizontalCarouselCollectionView.dataSource = self
    }
    
    private func registerCell() {
        horizontalCarouselCollectionView.register(HorizontalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCarouselCollectionViewCell.id)
    }
}

extension HorizontalCarouselCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCarouselCollectionViewCell.id, for: indexPath)
        if let cell = cell as? HorizontalCarouselCollectionViewCell {
            cell.model = dataSource[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: collectionView.frame.height)
       }
}
