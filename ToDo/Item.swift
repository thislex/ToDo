//
//  Item.swift
//  ToDo
//
//  Created by Lexter Tapawan on 02/12/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
