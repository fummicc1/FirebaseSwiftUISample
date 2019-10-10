//
//  TimelineModel.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/10.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

class TimelineModel: ObservableObject {
    @Published var itemArray: [Item] = []
    
    init() {
        Network.listen { itemArray in
            self.itemArray = itemArray
        }
    }
}
