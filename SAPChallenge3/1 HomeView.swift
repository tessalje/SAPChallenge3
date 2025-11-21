//
//  ContentView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

//coditional randering (if else)

import SwiftUI

struct HomescreenView: View {
    @State private var path = NavigationPath()
    @AppStorage("island") var selectedIsland: Bool = false
    @AppStorage("currentView") var currentView = 1
    @State private var showOnboarding = false
    @AppStorage("promptView") var promptView = 1  // 1 = show Prompt Island screen
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Homepage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                    
                    Spacer(minLength:100)
                    
                    VStack {
                        HStack {
                            Button {
                                promptView = 2 // ✅Switch views
                            } label: {
                                Image("PromptSign")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.5)
                     
                            }
                            
                            
                            Button {
                                promptView = 3
                            } label: {
                                Image("paint")
                                    .resizable()
                                    .frame(width: 100, height: 110)
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
                                        .fontWeight(.bold)
                                        .foregroundColor(.saddarkblue)
                                }
                            }
                            
                            NavigationLink(destination: FishingGameView()) {
                                Text("Cast Rod!")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding(20)
                                    .foregroundColor(.saddarkblue)
                                    .background(
                                        ZStack {
                                            Circle()
                                                .fill(Color.lightteal)
                                                .frame(width: 100, height: 100)
                                            
                                            Circle()
                                                .stroke(Color.saddarkblue, lineWidth: 4)
                                                .frame(width: 100, height: 100)
                                        }
                                    )
                            }
                            
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
                                        .fontWeight(.bold)
                                        .foregroundColor(.saddarkblue)
                                }
                            }
                        }
                        .padding(.bottom, 60)
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        currentView = 1
                        showOnboarding = true
                    } label: {
                        Image(systemName: "book.fill")
                    }
                    .padding(10)
                }
            }
            .sheet(isPresented: $showOnboarding) {
                OnboardingView()
            }
            .onAppear {
                selectedIsland = false
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct PromptView: View {
    @AppStorage("promptView") var promptView = 1
    
    var body: some View {
        NavigationStack {
            if promptView == 1 {
                HomescreenView()
                
            } else if promptView == 2 {
                ChallengeView()
            } else if promptView == 3 {
                GalleryView()
            }
            
        }
    }
}

#Preview {
    PromptView()
}
