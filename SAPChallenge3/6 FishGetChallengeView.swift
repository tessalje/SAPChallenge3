//
//  FishGetChallenge.swift
//  equipment
//
//  Created by Tessa Lee on 15/11/25.
//

import SwiftUI

struct FishGetChallengeView: View {
    @State private var mouthOpen = true
    @State private var randomRod = ""
    
    @AppStorage("rod") var selectedRod: String = "Random Rod"

    var body: some View {
        ZStack {
            Color(red: 0.83, green: 0.1, blue: 0.2)
                .ignoresSafeArea()
                .opacity(0.15)
            
            VStack {
                Text("YOU GOT...")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(Color.darkred)
                    .padding(.bottom, 20)
                    .offset(y: -100)
                
                ZStack {
                    Image("challengebox")
                        .resizable()
                        .frame(width: 370, height: 420)
                    
                    Image("hook2")
                        .resizable()
                        .frame(width: 310, height: 180)
                        .offset(x: -40, y: -255)
                    
                    VStack {
                        Image("challengefish")
                            .resizable()
                            .frame(width: 280, height: 220)
                            .offset(y: 50)
                            .padding(.bottom, 50)
                        
                        NavigationLink(destination: ChallengeView()) {
                            Text("Done")
                                .foregroundStyle(.white)
                                .padding(15)
                                .padding(.horizontal, 50)
                                .background(Color.darkred)
                                .cornerRadius(50)
                                .bold()
                        }
                        .padding(.top, 10)

                    }
                    Text(randomRod)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(Color.darkred)
                        .offset(y: -160)
                        .frame(width: 320)
                    
                    Circle()
                        .fill(Color.fishred)
                        .frame(width: 35, height: mouthOpen ? 35 : 5)
                        .offset(x: -110, y: 20)
                        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true),
                                   value: mouthOpen)

                }
                
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            mouthOpen.toggle()
            generateNewItem()
        }
    }

    func generateNewItem() {
        randomRod = challenges.randomElement() ?? "A CHALLENGE!"
    }
}

#Preview {
    FishGetChallengeView()
}

