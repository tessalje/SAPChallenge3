//
//  Collection.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
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

struct FishGrid: View {
    let items: [CollectedFish.FishCollected]

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(items) { item in
                    FishItem(item: item)
                }
            }
            .padding()
            
        }
    }
}

struct FishItem: View {
    let item: CollectedFish.FishCollected

    var body: some View {
        ZStack {
            Image("Redfish")
                .resizable()
                .frame(width: 150, height: 110)
            
            Text(item.name)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

struct FishGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let today = Calendar.current.startOfDay(for: Date())

            FishGrid(items: CollectedFish.shared.categorised[today] ?? [])
        }
    }
}
