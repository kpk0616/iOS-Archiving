//
//  CollectionViewController.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/21.
//

import UIKit

final class CollectionViewController: UIViewController {
    
    private var myCollectionView: MyCollectionView!
    private let dataSource = CollectionViewData.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        registerCollectionView()
    }
}

extension CollectionViewController {
    private func configure() {
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 7.0)
        collectionViewLayer.minimumLineSpacing = 5
        collectionViewLayer.minimumInteritemSpacing = 1
        
        myCollectionView = MyCollectionView(frame: .zero, collectionViewLayout: collectionViewLayer)
        myCollectionView.backgroundColor = .lightGray
        view.addSubview(myCollectionView)
        
        myCollectionView.snp.makeConstraints {
            $0.top.equalTo(120)
            $0.left.right.bottom.equalToSuperview().inset(40)
        }
    }
    
    private func registerCollectionView() {
        myCollectionView.register(MyCollectionView.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
    }
    
    private func setupCollectionViewDelegate() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.dataLabel.text = dataSource[indexPath.item]
        return cell
    }
    
    
}

