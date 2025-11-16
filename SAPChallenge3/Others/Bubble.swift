//
//  Bubble.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
//

import SwiftUI

struct BubbleData: Identifiable {
    let id = UUID()
    let size: CGFloat
    let startX: CGFloat
    let duration: Double
    let delay: Double
}


struct BubbleView: View {
    let data: BubbleData
    let tankHeight: CGFloat
    
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 0.0
    
    var body: some View {
        Circle()
            .fill(Color.white.opacity(0.3))
            .frame(width: data.size, height: data.size)
            .opacity(opacity)
            .offset(x: data.startX, y: offset + tankHeight / 3)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + data.delay) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        opacity = 1.0
                    }
                    withAnimation(
                        .linear(duration: data.duration)
                        .repeatForever(autoreverses: false)
                        .delay(0.5)
                    ) {
                        offset = -(tankHeight + 70)
                    }
                    
                    withAnimation(
                        .easeOut(duration: 0.8)
                        .delay(data.duration - 0.8)
                        .repeatForever(autoreverses: false)
                        .delay(0.5)
                    ) {
                        opacity = 0.0
                    }
                }
            }
    }
}
