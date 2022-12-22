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
    
    private lazy var scrollMoveButton: UIButton = {
        let button = UIButton()
        button.setTitle("4로 스크롤 이동", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapMoveScrollButton), for: .touchUpInside)
        return button
    }()
    
    var dataSource: [String] = []
    
    lazy var horizontalCarouselCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
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
        scrollMoveButton.backgroundColor = .brown
        scrollMoveButton.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        horizontalCarouselCollectionView.snp.makeConstraints {
            $0.top.equalTo(scrollMoveButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
    
    private func setupDataSource() {
        for i in 0...10 {
            dataSource += ["\(i)"]
        }
    }
    
    private func addSubviews() {
        view.addSubview(scrollMoveButton)
        view.addSubview(horizontalCarouselCollectionView)
    }
    
    private func setupDelegate() {
        horizontalCarouselCollectionView.delegate = self
        horizontalCarouselCollectionView.dataSource = self
    }
    
    private func registerCell() {
        horizontalCarouselCollectionView.register(HorizontalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCarouselCollectionViewCell.id)
    }
    
    @objc func didTapMoveScrollButton() {
        DispatchQueue.main.async {
            [weak self] in self?.horizontalCarouselCollectionView.scrollToItem(at: IndexPath(row: 4, section: 0), at: .top, animated: true)
        }
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
}

extension HorizontalCarouselCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 320)
       }
}
