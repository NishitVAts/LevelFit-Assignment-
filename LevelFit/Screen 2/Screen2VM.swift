//
//  Screen2VM.swift
//  LevelFit
//
//  Created by Nishit Vats on 01/03/25.
//

import Foundation

class Screen2VM: ObservableObject {
    
    @Published var row : [ListModel] = [
        .init(name: "My Favourites", icon: "Heart"),
        .init(name: "Download", icon: "Downloads"),
        .init(name: "My Playlist", icon: "Playlist"),
        .init(name: "My Journal Entries", icon: "Journal")
    ]
    
    @Published var dailyData: [LevelFitData] = [
            .init(xp: 110, Date: Date.from(year: 2025, month: 2, day: 19)), // Monday
            .init(xp: 150, Date: Date.from(year: 2025, month: 2, day: 20)), // Tuesday
            .init(xp: 200, Date: Date.from(year: 2025, month: 2, day: 21)), // Wednesday
            .init(xp: 100, Date: Date.from(year: 2025, month: 2, day: 22)), // Thursday
            .init(xp: 210, Date: Date.from(year: 2025, month: 2, day: 23)), // Friday
            .init(xp: 220, Date: Date.from(year: 2025, month: 2, day: 24)), // Saturday
            .init(xp: 180, Date: Date.from(year: 2025, month: 2, day: 25))  // Sunday
        ]
    
    @Published var weeklyData: [LevelFitData] = [
        .init(xp: 110, Date: Date.from(year: 2025, month: 2, day: 18)), // Week 1
        .init(xp: 150, Date: Date.from(year: 2025, month: 2, day: 19)),
        .init(xp: 300, Date: Date.from(year: 2025, month: 2, day: 26)), // Week 2
        .init(xp: 400, Date: Date.from(year: 2025, month: 2, day: 27)),
        .init(xp: 250, Date: Date.from(year: 2025, month: 3, day: 4))   // Week 3
    ]
    
    var groupedWeeklyData: [(weekNumber: Int, totalXP: Int)] {
        let grouped = Dictionary(grouping: weeklyData) { $0.Date.startOfWeek() }
        
        let sortedWeeks = grouped.keys.sorted()
        
        return sortedWeeks.enumerated().map { index, weekStart in
            let totalXP = grouped[weekStart]?.reduce(0) { $0 + $1.xp } ?? 0
            return (index + 1, totalXP)
        }
    }
    
    var averageXP: Double {
        let totalXP = dailyData.map { $0.xp }.reduce(0, +)
        return totalXP == 0 ? 0 : Double(totalXP) / Double(dailyData.count)
    }
}
