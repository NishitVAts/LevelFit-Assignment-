//
//  Screen2Model.swift
//  LevelFit
//
//  Created by Nishit Vats on 27/02/25.
//

import Foundation


struct LevelFitData:Identifiable{
    init(id: UUID = UUID(), xp: Int, Date: Date) {
        self.id = id
        self.xp = xp
        self.Date = Date
    }
    var id = UUID()
    var xp :Int
    var Date:Date
}

extension Date{
    static func from(year:Int, month:Int, day:Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
    
    func startOfWeek() -> Date {
        Calendar.current.dateInterval(of: .weekOfYear, for: self)?.start ?? self
    }
    
    func dayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E" // "E" gives short day names (Mon, Tue, etc.) Used ChatGPT here
        return String(formatter.string(from: self).prefix(1))
    }
}

class Screen2VM: ObservableObject {
    
    @Published var dailyData: [LevelFitData] = [
        .init(xp: 110, Date: Date.from(year: 2025, month: 2, day: 19)), // Monday
            .init(xp: 150, Date: Date.from(year: 2025, month: 2, day: 20)), // Tuesday
            .init(xp: 300, Date: Date.from(year: 2025, month: 2, day: 21)), // Wednesday
            .init(xp: 400, Date: Date.from(year: 2025, month: 2, day: 22)), // Thursday
            .init(xp: 250, Date: Date.from(year: 2025, month: 2, day: 23)), // Friday
            .init(xp: 320, Date: Date.from(year: 2025, month: 2, day: 24)), // Saturday
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
