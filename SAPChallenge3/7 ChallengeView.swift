//
//  ChallengeView.swift
//  equipment
//
//  Created by .. on 7/11/25.
//
import SwiftUI

struct ChallengeView: View {
    @AppStorage("island") var selectedIsland: Bool = false
    @State private var goToHome = false    // <- controls screen switching
    @AppStorage("promptView") var promptView = 1
    
    var body: some View {
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
                    
                  
                    Button {
                        promptView = 1
                    } label: {
                        Image("ChallengeSign")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.47)
                    }
                    
                    Button{
                        promptView = 3
                    } label: {
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
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 100, height: 100)
                                
                                Circle()
                                    .stroke(Color.darkred, lineWidth: 5)
                                    .frame(width: 100, height: 100)
                            }
                        )
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChallengeView()
}
