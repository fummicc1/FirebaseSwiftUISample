//
//  Item.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/10.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: String
    var senderName: String
    var message: String
}
