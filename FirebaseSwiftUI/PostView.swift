//
//  PostView.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/10.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import SwiftUI
import Firebase

struct PostView: View {
    
    @State(initialValue: Item(data: [:])) var item: Item
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            TextField("message", text: $item.message).padding()
            TextField("sender", text: $item.senderName).padding()
            Button(action: {
                let document = Firestore.firestore().collection("items").document()
                self.item.id = document.documentID
                Network.create(item: self.item, document: document) {
                    self.presentation.wrappedValue.dismiss()
                }
            }) {
                Text("投稿")
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
