//
//  8 GalleryView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("gallery view")
                NavigationLink(destination: HomescreenView()) {
                    Text("Home")
                }
            }
        }
    }
}
