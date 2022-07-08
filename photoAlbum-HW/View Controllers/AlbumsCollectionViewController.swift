//
//  AlbumsCollectionViewController.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import UIKit

struct Item {
    
    let text: String
    let image: UIImage?
    let number: UInt
}

enum Sections: Int {
    case first = 0
    case second = 1
    case third = 2
    case four = 3
}

class AlbumsCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    let arrayItems: [[Item]] = [
    [Item(text: "Tyt text", image: UIImage(named: "photo10"), number: 234),
     Item(text: "Tyt text", image: UIImage(named: "photo9"), number: 345),
     Item(text: "Tyt text", image: UIImage(named: "photo8"), number: 456),
     Item(text: "Tyt text", image: UIImage(named: "photo7"), number: 678),
     Item(text: "Tyt text", image: UIImage(named: "photo6"), number: 789),
     Item(text: "Tyt text", image: UIImage(named: "photo5"), number: 987),
     Item(text: "Tyt text", image: UIImage(named: "photo4"), number: 765),
     Item(text: "Tyt text", image: UIImage(named: "photo3"), number: 913)]
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
    
    private func setupFirstLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95/2), heightDimension: .fractionalHeight(1))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(98)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        section.orthogonalScrollingBehavior = .paging
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
                return arrayItems[0].count
            case 1:
                return 0
            case 2:
                return 0
            case 3:
                return 0
            default:
                return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
            let item = arrayItems[indexPath.section][indexPath.row]
            switch(indexPath as NSIndexPath).section {
                
            case 0:
                cell.photoImageView.image = item.image
                cell.namePhotoLabel.text = item.text
                cell.numberPhotosLabel.text = item.number.formatterWithSeparator
            default: break
            }
            return cell
        }
    }
