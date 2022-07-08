//
//  UIStackView.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
