//
//  API.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/10.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation
import Firebase

class Network {
    
    static func listen(success: @escaping ([Item]) -> ()) {
        Firestore.firestore().collection("items").addSnapshotListener { (snapshots, error) in
            if let error = error {
                print("\(error)")
                return
            }
            if let snapshots = snapshots {
                if snapshots.metadata.hasPendingWrites { return }
                let documents = snapshots.documents
                var itemArray: [Item] = []
                for document in documents {
                    let data = document.data()
                    let item = Item(data: data)
                    itemArray.append(item)
                    success(itemArray)
                }
            }
        }
    }
    
    static func create(item: Item, document: DocumentReference, success: @escaping () -> ()) {
        document.setData(item.dictionary) { error in
            if let error = error {
                print("\(error)")
                return
            }
            success()
        }
    }
    
    static func update(item: Item, document: DocumentReference, success: @escaping () -> ()) {
        document.setData(item.dictionary, merge: true) { error in
            if let error = error {
                print("\(error)")
                return
            }
            success()
        }
    }
    
    static func delete(document: DocumentReference, success: @escaping () -> ()) {
        document.delete { error in
            if let error = error {
                print("\(error)")
                return
            }
            success()
        }
    }
}
