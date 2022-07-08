//
//  AlbumCell.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let reuseID = "CellID"
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Metric.namePhotoLabelFont)
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Metric.numberPhotoLabelFont)
        label.textColor = .systemGray6
        return label
    }()
    

    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubviewsForAutoLayout([
        photoImageView,
        namePhotoLabel,
        numberPhotosLabel
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.indent),
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Metric.indent)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Metric {
    static let indent: CGFloat = 4
    static let photoRadius: CGFloat = 10
    static let namePhotoLabelFont: CGFloat = 17
    static let numberPhotoLabelFont: CGFloat = 15
}
