//
//  ContentView.swift
//  equipment
//
//  Created by .. on 7/11/25.
//

import SwiftUI

struct HomescreenView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                
                Image("Homepage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)       .edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)       .frame(width: 170, height: 170)
                    Spacer()
                    
                    
                    

                    VStack{
                        
                        Spacer()
                        
                        HStack(alignment: .bottom, spacing:40) {
                            
                            NavigationLink(destination: EquipmentView()) {
                                Text("Collection")
                                
                            }
                            .alignmentGuide(.bottom) { d in d[.bottom] }
                            
                            NavigationLink(destination: EquipmentView()) {
                                Text("Cast Rod!")
                                    .multilineTextAlignment(.center)
                                    .padding(20)
                                    .foregroundColor(Color.white)
                                    .background(
                                        
                                        ZStack{
                                            
                                            Circle()
                                                .fill(Color.blue)
                                                .frame(width: 100, height: 100)
                                            
                                            Circle()
                                                .stroke(Color.darkblue, lineWidth: 5)
                                                .frame(width: 100, height: 100)
                                            
                                        }
                                    )
                                
                                // change the equipmentview to the fishingview later for the cast rod button same for collectionview
                                
                            }
                            .alignmentGuide(.bottom) { d in d[.bottom] }
                            
                            NavigationLink(destination: EquipmentView()) {
                                Text("Equipment")
                                
                            }
                            .alignmentGuide(.bottom) { d in d[.bottom] }
                            .padding(.bottom, 40)
                            
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    HomescreenView()
}
