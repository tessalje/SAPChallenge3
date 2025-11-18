//
//  ChallengeView.swift
//  equipment
//
//  Created by .. on 7/11/25.
//

import SwiftUI

struct ChallengeView: View {
    @State private var path = NavigationPath()
    @AppStorage("island") var selectedIsland: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Hellpage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: HomescreenView()) {
                            Image("PromptSign")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.47)
                            
                        }
                        
                        NavigationLink(destination: GalleryView()) {
                            Image("paint")
                                .resizable()
                                .frame(width: 110, height: 110)
                        }
                        .offset(y: -50)
                    }
                    .offset(y: -50)
                    
                    NavigationLink(destination: FishingGameView()) {
                        Text("Cast Rod!")
                            .multilineTextAlignment(.center)
                            .padding(20)
                            .foregroundColor(Color.white)
                            .background(
                                ZStack{
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 100, height: 100)
                                    
                                    Circle()
                                        .stroke(Color.darkred, lineWidth: 5)
                                        .frame(width: 100, height: 100)
                                })
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            selectedIsland = true
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ChallengeView()
}

