//
//  StartGame.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//


import SwiftUI

struct StartGameView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                NavigationLink("START") {
                    FishingGameView()
                }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
                .font(.system(.title, design: .monospaced))
            }
        }
    }
}

#Preview {
    StartGameView()
}
