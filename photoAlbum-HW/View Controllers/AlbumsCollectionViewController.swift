//
//  AlbumsCollectionViewController.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import UIKit

enum Sections: Int {
    case first = 0
    case second = 1
    case third = 2
    case four = 3
}

class AlbumsCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    let arrayModels: [[Item]] = [
        [Item(text: "Tyt text", image: UIImage(named: "photo10"), number: 234),
         Item(text: "Tyt text", image: UIImage(named: "photo9"), number: 345),
         Item(text: "Tyt text", image: UIImage(named: "photo8"), number: 456),
         Item(text: "Tyt text", image: UIImage(named: "photo7"), number: 678),
         Item(text: "Tyt text", image: UIImage(named: "photo6"), number: 789),
         Item(text: "Tyt text", image: UIImage(named: "photo5"), number: 987),
         Item(text: "Tyt text", image: UIImage(named: "photo4"), number: 765),
         Item(text: "Tyt text", image: UIImage(named: "photo3"), number: 913)],
        
        [Item(text: "Tyt text", image: UIImage(named: "photo2"), number: 222),
         Item(text: "Tyt text", image: UIImage(named: "photo1"), number: 333),
         Item(text: "Tyt text", image: UIImage(named: "photo7"), number: 888),
         Item(text: "Tyt text", image: UIImage(named: "photo9"), number: 987)],
        
        [Item(text: "Video", image: UIImage(systemName: "video")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
              number: 999),
         Item(text: "Selfy", image: UIImage(systemName: "person.crop.square")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 1045),
         Item(text: "Photo Live Photos", image: UIImage(systemName: "livephoto")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 1945),
         Item(text: "Portretu", image: UIImage(systemName: "cube")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 1133),
         Item(text: "Panoramu", image: UIImage(systemName: "pano")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 1045),
         Item(text: "Serii", image: UIImage(systemName: "square.stack.3d.down.right")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 3334),
         Item(text: "Snimki Ekrana", image: UIImage(systemName: "camera.viewfinder")?
             .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
               number: 998)]
    ]
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    // MARK: - Settings
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: AlbumCell.reuseID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: addButton)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Альбомы"
    }
    
    // MARK: - SetupLayout
    
    // First Section
    
    private func setupFirstLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475), heightDimension: .fractionalWidth(1))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(98)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // Second Section
    
    private func setupSecondLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475), heightDimension: .fractionalWidth(1))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(98)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(65))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // Third Section
    
    private func setupThirdLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/8))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0)

        let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
    
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 12
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: itemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            switch sectionLayout {
            case .first:
                return self.setupFirstLayout()
            case .second:
                return nil
            case .third:
                return nil
            case .four:
                return nil
            }
        }
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayModels[0].count
        case 1:
            return arrayModels[1].count
        case 2:
            return arrayModels[2].count
        case 3:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
        let item = arrayModels[indexPath.section][indexPath.row]
        switch(indexPath as NSIndexPath).section {
            
        case 0, 1:
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = "\(item.number)"
            return cell
        default: break
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView else {
            return HeaderView()
        }
        switch indexPath.section {
        case 0:
            headerView.label.text = "Мои альбомы"
            headerView.button.text = "Все"
        case 1:
            headerView.label.text = "Общие альбомы"
            headerView.button.text = "Все"
        case 2:
            headerView.label.text = "Типы медиафайлов"
            headerView.button.text = nil
        default:
            break
        }
        return headerView
    }
}
