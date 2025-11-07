//
//  ContentView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Page")
                    .font(.system(.title, design: .monospaced))
                    .bold()
                NavigationLink("Go Fishing") {
                    StartGameView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
