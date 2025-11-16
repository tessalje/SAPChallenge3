//
//  9 Tutorial.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 17/11/25.
//

import SwiftUI
import Foundation

struct Page: Identifiable {
  var id = UUID()
  var title: String
  var image: String
}

var totalViews = 5

struct TutoralView: View {
    @AppStorage("currentView") var currentView = 1
    
    var title: String
    var image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .ignoresSafeArea()
            
            Text(title)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                .offset(y: -350)
            
            Button(action:{
                    withAnimation(.easeOut) {
                        if currentView <= totalViews || currentView == 2 {
                            currentView += 1
                        }
                    }
                },label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .padding(17)
                        .overlay(
                            ZStack{
                                Circle()
                                    .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                    .padding()
                                    .foregroundColor(Color.white)
                            })
                })
            .offset(x: 120, y: 360)
            
            Button(action:{
                currentView = 6
            }, label: {
                HStack {
                    Text("Skip")
                        .foregroundColor(Color.white)
                }
            })
            .buttonStyle(.borderedProminent)
            .offset(x: -130, y: 360)
            
        }
    }
}


struct OnboardingView: View {
    @AppStorage("currentView") var currentView = 1
    
    var body: some View {
        
        if currentView == 1 {
            TutoralView(title: "Step 1",image: "onboarding1")
        } else if currentView == 2 {
            TutoralView(title: "Step 2",image: "onboarding2")
        } else if currentView == 3 {
            TutoralView(title: "Step 3",image: "onboarding3")
        } else if currentView == 4 {
            TutoralView(title: "Step 4",image: "onboarding4")
        } else if currentView == 5 {
            TutoralView(title: "Step 5",image: "onboarding5")
        }
        if currentView == 6 {
            HomescreenView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
