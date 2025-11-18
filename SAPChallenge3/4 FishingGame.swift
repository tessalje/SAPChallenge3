//
//  FishingGame.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 6/11/25.
//

import SwiftUI

struct FishingGameView: View {
    
    @State private var hookPosition = CGPoint(x: 200, y: 50)
    @State private var redPosition = CGPoint(x: -100, y: 400)
    @State private var greenPosition = CGPoint(x: -100, y: 200)
    @State private var bluePosition = CGPoint(x: -100, y: 300)
    @State private var purplePosition = CGPoint(x: -100, y: 500)
    
    let hookWidth: CGFloat = 100
    let redWidth: CGFloat = 100
    let greenWidth: CGFloat = 100
    let blueWidth: CGFloat = 90
    let purpleWidth: CGFloat = 120
    
    @State private var collisionDetected = false
    
    @State private var Catch = false
    
    @State private var isFishCaught = false
    @State private var isTextCaught = false
    
    @State private var gameTimer: Timer? = nil
    
    @AppStorage("island") var selectedIsland: Bool = false

    func checkCollision() {
        let hookFrame = CGRect(
            x: hookPosition.x - hookWidth/2,
            y: hookPosition.y - 80/2,
            width: hookWidth,
            height: 80
        )
        
        let fishFrames = [
            CGRect(x: redPosition.x - redWidth/2,
                   y: redPosition.y - redWidth/2,
                   width: redWidth,
                   height: redWidth
                  ),
            CGRect(x: greenPosition.x - greenWidth/2,
                   y: greenPosition.y - greenWidth/2,
                   width: greenWidth,
                   height: greenWidth),
            CGRect(x: bluePosition.x - blueWidth/2,
                   y: bluePosition.y - blueWidth/2,
                   width: blueWidth,
                   height: blueWidth),
            CGRect(x: purplePosition.x - purpleWidth/2,
                   y: purplePosition.y - purpleWidth/2,
                   width: purpleWidth,
                   height: purpleWidth)
        ]
        
        collisionDetected = fishFrames.contains { hookFrame.intersects($0) }
        print(collisionDetected)
        
        if collisionDetected {
            isTextCaught = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isFishCaught = true
            }
            gameTimer?.invalidate()
            gameTimer = nil
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    if isTextCaught == true {
                        Text("YOU CAUGHT A FISH!")
                            .font(.system(.title, design: .monospaced))
                            .bold()
                            .foregroundStyle(.saddarkblue)
                    } else {
                        Text("GO FISH!")
                            .font(.system(.title, design: .monospaced))
                            .bold()
                            .foregroundStyle(.saddarkblue)
                    }
                    
                    Image("equipment")
                        .resizable()
                        .frame(width: 60, height: 50)
                }
                
                ZStack {
                    Image("water")
                        .resizable()
                        .ignoresSafeArea()
                    
                    if Catch == true {
                        Image("Hook")
                            .resizable()
                            .frame(width: hookWidth, height: 80)
                            .position(hookPosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        hookPosition = value.location
                                        checkCollision()
                                    })
                    }
                    
                    Image("Purplefish")
                        .resizable()
                        .scaleEffect(x: -1)
                        .frame(width: purpleWidth , height: 70)
                        .position(purplePosition)
                    
                    Image("Greenfish")
                        .resizable()
                        .scaleEffect(x: -1)
                        .frame(width: greenWidth , height: 70)
                        .position(greenPosition)
                    
                    Image("Redfish")
                        .resizable()
                        .scaleEffect(x: -1)
                        .frame(width: redWidth , height: 60)
                        .position(redPosition)
                    
                    Image("Bluefish")
                        .resizable()
                        .scaleEffect(x: -1)
                        .frame(width: blueWidth , height: 60)
                        .position(bluePosition)
                    
                    Button(action: {
                        Catch = true
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
                    .offset(y: 300)
                    
                }
                .onAppear {
                    gameTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                        redPosition.x += 6
                        if redPosition.x > 450 {
                            redPosition.x = -100
                        }
                        
                        greenPosition.x += 4
                        if greenPosition.x > 450 {
                            greenPosition.x = -100
                        }
                        
                        bluePosition.x += 7
                        if bluePosition.x > 450 {
                            bluePosition.x = -100
                        }
                        
                        purplePosition.x += 10
                        if purplePosition.x > 450 {
                            purplePosition.x = -100
                        }
                        
                        checkCollision()
                    }
                }
            }
            .navigationDestination(isPresented: $isFishCaught) {
                Group {
                    if selectedIsland == false {
                        FishGetView()
                    } else {
                        FishGetChallengeView()
                    }
                }
            }
            .background(Color.bgcolor)
        }
    }
}

#Preview {
    FishingGameView()
}


