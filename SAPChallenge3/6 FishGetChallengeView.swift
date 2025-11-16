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
            Color(red: 0.73, green: 0.89, blue: 1)
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack {
                Text("YOU GOT...")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.8))
                    .padding(.bottom, 20)
                    .offset(y: -100)
                
                ZStack {
                    Image("box")
                        .resizable()
                        .frame(width: 370, height: 420)
                    
                    Image("hook2")
                        .resizable()
                        .frame(width: 310, height: 180)
                        .offset(x: -40, y: -255)
                    
                    VStack {
                        Image("fish")
                            .resizable()
                            .frame(width: 300, height: 250)
                            .offset(y: 50)
                            .padding(.bottom, 50)
                        
                        NavigationLink(destination: HomescreenView()) {
                            Text("Upload Drawing")
                                .foregroundStyle(.white)
                                .padding(15)
                                .padding(.horizontal, 50)
                                .background(Color(red: 0, green: 0.5, blue: 0.8))
                                .cornerRadius(50)
                                .bold()
                        }
                        .padding(.top, 10)

                    }
                    Text(randomRod)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.8))
                        .offset(y: -160)
                        .frame(width: 340)
                    
                    Circle()
                        .fill(Color.fishblue)
                        .frame(width: 35, height: mouthOpen ? 35 : 5)
                        .offset(x: -110, y: 30)
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
