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
            Color(red: 0.68, green: 0.88, blue: 1.0)
                .ignoresSafeArea()
            
            VStack {
                Text("YOU GOT...")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.8))
                    .padding(.bottom, 20)
                
                ZStack {
                    FishShape()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.blue.opacity(0.7)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 260, height: 140)
                        .overlay(
                            Triangle()
                                .fill(Color.blue.opacity(0.8))
                                .frame(width: 80, height: 80)
                                .offset(x: 130, y: 0)
                        )
                    
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 20, height: 15)
                        .offset(x: -70, y: -10)
                    
                    
                    Text(randomRod)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(maxWidth: 100)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(5)
                    
                    // Mouth
                    Circle()
                        .fill(Color(red: 0.68, green: 0.88, blue: 1.0))
                        .frame(width: 35, height: mouthOpen ? 35 : 5)
                        .offset(x: -130, y: 0)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true),
                                   value: mouthOpen)
                }
                
                NavigationLink(destination: ChallengeView()) {
                    Text("Done")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
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
