//
//  Collection.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
//

import SwiftUI
import SwiftData


//
//class CollectedFish {
//    static let shared = CollectedFish()
//    
//    var categorised: [Date: [FishCollected]] = [:]
//    
//    var sortedDates: [Date] {
//        categorised.keys.sorted(by: >)
//    }
//    
//}

@Model
class FishCollected: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    
    init(id: UUID = UUID(), name: String, date: Date) {
        self.id = id
        self.name = name
        self.date = date
    }
}
    
struct FishGrid: View {
    @Query var items: [FishCollected]
    
    let fishImage: [String] = ["Redfish", "Greenfish", "Bluefish", "Purplefish",]

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    
                    let image = fishImage[index % fishImage.count]
                    
                    FishItem(item: item, image: image)
                }
            }
            .padding()
            
        }
    }
}

struct FishItem: View {
    let item: FishCollected
    let image: String

    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 110)
            
            Text(item.name)
                .padding(6)
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.gray.opacity(0.67))
                .cornerRadius(10)
        }
    }
}
