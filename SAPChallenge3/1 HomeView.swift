//
//  ContentView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

import SwiftUI

struct HomescreenView: View {
    @State private var path = NavigationPath()
    @AppStorage("island") var selectedIsland: Bool = false
    @AppStorage("currentView") var currentView = 1
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Homepage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                    Spacer()
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: ChallengeView()) {
                                Image("ChallengeSign")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.5)
                                    .offset(y: 20)
                            }
                            
                            NavigationLink(destination: GalleryView()) {
                                Image("paint")
                                    .resizable()
                                    .frame(width: 110, height: 110)
                                    .offset(x: -13, y: -40)
                            }
                                
                        }
                        
                        HStack(alignment: .bottom, spacing: 40) {
                            NavigationLink(destination: CollectionView()) {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 90, height: 90)
                                            .foregroundColor(.white)
                                        Image("Bucket")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 70)
                                    }
                                    Text("Collection")
                                        .foregroundColor(.black)
                                }
                            }
                            
                            NavigationLink(destination: FishingGameView()) {
                                
                                Text("Cast Rod!")
                                    .multilineTextAlignment(.center)
                                    .padding(20)
                                    .foregroundColor(Color.white)
                                    .background(
                                        ZStack{
                                            Circle()
                                                .fill(Color.blue)
                                                .frame(width: 100, height: 100)
                                            
                                            Circle()
                                                .stroke(Color.saddarkblue, lineWidth: 5)
                                                .frame(width: 100, height: 100)
                                        })
                            }
                            .alignmentGuide(.bottom) { d in d[.bottom] }
                            
                            HStack(alignment: .bottom, spacing: 40) {
                                NavigationLink(destination: EquipmentView()) {
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .frame(width: 90, height: 90)
                                                .foregroundColor(.white)
                                            Image("equipment")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 80)
                                        }
                                        Text("Equipment")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .alignmentGuide(.bottom) { d in d[.bottom] }
                            .padding(.bottom, 40)
                            
                        }
                    }
                }
            }
        }
        .onAppear {
            selectedIsland = false
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    HomescreenView()
}
