//
//  CollectionViewController.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/21.
//

import UIKit
import SnapKit

final class CollectionViewController: UIViewController {
  
  private var myCollectionView: MyCollectionView!
  private let dataSource = CollectionViewData.data
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    registerCollectionView()
    setupCollectionViewDelegate()
    layout()
  }
}

extension CollectionViewController {
  private func configure() {
    
    let collectionViewLayer = UICollectionViewFlowLayout()
    collectionViewLayer.sectionInset = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 7.0)
    collectionViewLayer.minimumLineSpacing = 5
    collectionViewLayer.minimumInteritemSpacing = 1
    
    myCollectionView = MyCollectionView(frame: .zero, collectionViewLayout: collectionViewLayer)
  }
  
  private func layout() {
    view.backgroundColor = .white
    view.addSubview(myCollectionView)
    myCollectionView.backgroundColor = .secondarySystemBackground
    myCollectionView.snp.makeConstraints {
      $0.top.equalTo(120)
      $0.left.right.bottom.equalToSuperview().inset(40)
    }
  }
  
  private func registerCollectionView() {
    myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
  }
  
  private func setupCollectionViewDelegate() {
    myCollectionView.dataSource = self
    myCollectionView.delegate = self
  }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return UICollectionViewFlowLayout.automaticSize
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
    cell.dataLabel.text = dataSource[indexPath.item]
    return cell
  }
  
  
}

