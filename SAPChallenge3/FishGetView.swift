//
//  FishGet.swift
//  equipment
//
//  Created by Tessa Lee on 14/11/25.
//

import SwiftUI


class CollectedFish {
    static let shared = CollectedFish()
    
    var categorised: [Date: [FishCollected]] = [:]
    
    var sortedDates: [Date] {
        categorised.keys.sorted(by: >)
    }
    
    struct FishCollected: Identifiable, Hashable, Codable {
        var id = UUID()
        let name: String
    }
}

struct FishGetView: View {
    @State private var mouthOpen = true
    @State private var randomItem = ""
    
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
                                .frame(width: 60, height: 60)
                                .offset(x: 130, y: 0)
                        )
                    
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 12, height: 12)
                        .offset(x: -70, y: -10)
                    
                    
                    Text(randomItem)
                        .font(.system(size: 20, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(5)
                    
                    Circle()
                        .fill(Color(red: 0.68, green: 0.88, blue: 1.0))
                        .frame(width: 35, height: mouthOpen ? 35 : 5)
                        .offset(x: -130, y: 0)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true),
                                   value: mouthOpen)
                }
                
                NavigationLink(destination: HomescreenView()) {
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
        if selectedRod == "Animal Rod" {
            randomItem = animals.randomElement() ?? "AN ANIMAL!"
            addItemToCategory(item: randomItem)
        } else if selectedRod == "Object Rod" {
            randomItem = items.randomElement() ?? "AN OBJECT!"
            addItemToCategory(item: randomItem)
        } else if selectedRod == "Random Rod" {
            randomItem = combinedRod.randomElement() ?? ""
            addItemToCategory(item: randomItem)
        } else if selectedRod == "Location Rod" {
            randomItem = locations.randomElement() ?? "A LOCATION!"
            addItemToCategory(item: randomItem)
        }
    }

    func addItemToCategory(item: String) {
        let today = Calendar.current.startOfDay(for: Date())
        
        let fish = CollectedFish.FishCollected(name: item)
        
        if var todayItem = CollectedFish.shared.categorised[today] {
            todayItem.append(fish)
            CollectedFish.shared.categorised[today] = todayItem
            
        } else {
            CollectedFish.shared.categorised[today] = [fish]
        }
    }
}


struct FishShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.midX * 0.5, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 20, y: rect.midY),
                          control: CGPoint(x: rect.maxX, y: rect.midY - 40))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                          control: CGPoint(x: rect.maxX, y: rect.midY + 40))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY),
                          control: CGPoint(x: rect.midX * 0.5, y: rect.maxY))
        return path
    }
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}



#Preview {
    FishGetView()
}
