//
//  UInt+Extension.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import Foundation

extension UInt {
    var formatterWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
