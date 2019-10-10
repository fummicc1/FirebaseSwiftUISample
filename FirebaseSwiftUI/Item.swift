//
//  Item.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/10.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    var id: String
    var senderName: String
    var message: String
    
    init(data: [String: Any]) {
        id = data["id"] as? String ?? ""
        senderName = data["senderName"] as? String ?? ""
        message = data["message"] as? String ?? ""
    }
    
    var dictionary: [String: Any] {
        return [
            "id": id,
            "senderName": senderName,
            "message": message
        ]
    }
}
