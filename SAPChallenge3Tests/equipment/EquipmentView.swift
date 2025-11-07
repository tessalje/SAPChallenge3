//
//  EquipmentView.swift
//  equipment
//
//  Created by .. on 7/11/25.
//

import SwiftUI

struct EquipmentView: View {
    var body: some View {
        
        
        
        NavigationStack{
            
            
            ZStack{
                Color.lightteal.edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack(spacing:30){
                        Text("Equipment")
                            .font(.largeTitle)
                            .padding(.top)
                        
                        VStack(spacing:15){
                            
                            
                            Text("Rods")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Change the category of prompts")
                                .padding()
                                .background(Color.pink)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button("Random Rod") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Animal Rod") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Object Rod") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Location Rod") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.sadturquoise)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        
                        
                        
                        VStack(spacing: 15) {
                            Text("Baits")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Change the amount of prompts")
                            
                            Button("Random Bait") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Animal Bait") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Object Bait") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                            Button("Location Bait") {
                                
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.saddarkblue)
                            .cornerRadius(10)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.sadturquoise)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}
#Preview {
    EquipmentView()
}
