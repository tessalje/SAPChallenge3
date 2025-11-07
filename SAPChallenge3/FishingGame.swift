//
//  FishingGame.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

import SwiftUI

struct FishingGameView: View {
    @State var positionX = -250
    @State var position2X = -250
    @State var position3X = -250
    @State var position4X = -250
    
    @State var positionY = -30
    
    var body: some View {
        VStack {
            Text("GO FISH!")
                .font(.system(.title, design: .monospaced))
                .bold()
                .foregroundStyle(.white)
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Image("hook")
                        .resizable()
                        .offset(y: CGFloat(positionY))
                        .frame(width: 70, height: 100)
                        .animation(Animation.easeInOut(duration:8).speed(1))
                        .onAppear() {
                            positionY += 550
                        }
                    
                    Image("fish")
                        .resizable()
                        .frame(width: 100, height:100)
                        .offset(x: CGFloat(positionX))
                        .animation(Animation.easeInOut(duration:6).repeatForever(autoreverses: false).speed(2))
                        .onAppear() {
                            positionX += 600
                        }
                    
                    Image("fish2")
                        .resizable()
                        .frame(width: 100, height:100)
                        .offset(x: CGFloat(position2X))
                        .animation(Animation.easeInOut(duration:3).repeatForever(autoreverses: false).speed(2))
                        .onAppear() {
                            position2X += 600
                        }
                        .padding(20)
                    
                    Image("fish3")
                        .resizable()
                        .frame(width: 100, height:100)
                        .offset(x: CGFloat(position3X))
                        .animation(Animation.easeInOut(duration:7).repeatForever(autoreverses: false).speed(5))
                        .onAppear() {
                            position3X += 600
                        }
                    
                    Image("fish4")
                        .resizable()
                        .frame(width: 100, height:100)
                        .offset(x: CGFloat(position4X))
                        .animation(Animation.easeInOut(duration:4).repeatForever(autoreverses: false).speed(2))
                        .onAppear() {
                            position4X += 600
                        }
                    
                    Button(action: {
                    }){
                        ZStack {
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.cyan)
                            Text("catch")
                                .foregroundStyle(.white)
                                .font(.system(.title, design: .rounded))
                        }
                    }
                }
            }
        }
        .background(.cyan.opacity(0.5))
    }
}

#Preview {
    FishingGameView()
}
