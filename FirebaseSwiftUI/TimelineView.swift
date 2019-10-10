//
//  ContentView.swift
//  FirebaseSwiftUI
//
//  Created by Fumiya Tanaka on 2019/10/09.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject(initialValue: TimelineModel()) var model: TimelineModel
    
    @State var isShowingPostView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List(model.itemArray) { (item: Item) in
                    Text(item.senderName).frame(width: 160, height: 64, alignment: .center)
                    Text(item.message).bold().frame(width: 160, height: 46, alignment: .center)
                }
                Button(action: {
                    self.isShowingPostView = true
                }) {
                    Text("+").font(Font.title).bold().frame(width: 120, height: 24, alignment: .center).padding()
                }.sheet(isPresented: $isShowingPostView) {
                    PostView()
                }
            }.navigationBarTitle("SwiftUIWithFirebase")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
