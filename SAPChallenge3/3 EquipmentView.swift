//
//  EquipmentView.swift
//  equipment
//
//  Created by .. on 7/11/25.
//

import SwiftUI

struct EquipmentView: View {
    
    @AppStorage("rod") var selectedRod: String = ""

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.lightteal.edgesIgnoringSafeArea(.all)
                
                    VStack(alignment: .center, spacing: 30) {
                        
                        Text("Equipment 🎣")
                            .font(.system(size:45))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.saddarkblue)
                            .padding(.top, 80)
                        
                     
                        VStack(spacing: 20) {
                            
                            Text("Rods")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                            
                            if selectedRod.isEmpty {
                                Text("Pick your prompt category")
                                    .bold()
                                    .frame(width: 300, height: 20)
                                    
                                    .foregroundColor(Color.saddarkblue)
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 5)
                            } else {
                                Text("Current Rod: **\(selectedRod)**")
                                    .font(.title3)
                                    .foregroundColor(.saddarkblue)
                                    .padding(.top, 10)
                            }
                            
                            //button
                            VStack(spacing: 20) {
                                Button("Random Rod ★") { selectedRod = "Random Rod" }
                                Button("Animal Rod 🐠") { selectedRod = "Animal Rod" }
                                Button("Object Rod ⚽️") { selectedRod = "Object Rod" }
                                Button("Location Rod 🏠") { selectedRod = "Location Rod" }
                                Button("Food Rod 🍕") { selectedRod = "Food Rod" }
                            }
                            .font(.system(size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(.lightteal)
                            .frame(width: 300, height:300)
                            .padding(.horizontal, 10)
                            .buttonStyle(.borderedProminent)
                            .tint(Color.saddarkblue)
                            
                        }
                        .padding(90)
                        .frame(maxWidth: .infinity)
                        .background(Color.sadturquoise)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 5)
                        .padding(.horizontal, 10)
                        
                        
                        Spacer()
                    }
                    .padding(.bottom, 50)
                }
                
            }
        }
}

#Preview {
    EquipmentView()
}

