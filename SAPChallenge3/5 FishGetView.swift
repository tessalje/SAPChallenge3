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
            Color(red: 0.73, green: 0.89, blue: 1)
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack {
                Text("YOU GOT...")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.8))
                    .padding(.bottom, 20)
                    .offset(y: -100)
                
                ZStack {
                    Image("box")
                        .resizable()
                        .frame(width: 370, height: 420)
                    
                    Image("hook2")
                        .resizable()
                        .frame(width: 310, height: 180)
                        .offset(x: -50, y: -240)
                    
                    VStack {
                        Image("fish")
                            .resizable()
                            .frame(width: 300, height: 250)
                            .offset(y: 50)
                            .padding(.bottom, 50)
                        
                        NavigationLink(destination: HomescreenView()) {
                            Text("Upload Drawing")
                                .foregroundStyle(.white)
                                .padding(15)
                                .padding(.horizontal, 50)
                                .background(Color(red: 0, green: 0.5, blue: 0.8))
                                .cornerRadius(50)
                                .bold()
                        }
                        .padding(.top, 10)

                    }
                    
                    Text(randomItem)
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.8))
                        .offset(y: -160)
                    
                    Circle()
                        .fill(Color.fishblue)
                        .frame(width: 35, height: mouthOpen ? 35 : 5)
                        .offset(x: -110, y: 30)
                        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true),
                                   value: mouthOpen)

                }
                
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
        } else if selectedRod == "Food Rod" {
            randomItem = food.randomElement() ?? "A FOOD!"
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


//struct FishShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
//        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
//                          control: CGPoint(x: rect.midX * 0.3, y: rect.minY))
//        path.addQuadCurve(to: CGPoint(x: rect.maxX - 25, y: rect.midY),
//                          control: CGPoint(x: rect.maxX, y: rect.midY - 40))
//        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
//                          control: CGPoint(x: rect.maxX, y: rect.midY + 40))
//        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY),
//                          control: CGPoint(x: rect.midX * 0.3, y: rect.maxY))
//        return path
//    }
//}

//
//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.closeSubpath()
//        return path
//    }
//}



#Preview {
    FishGetView()
}

