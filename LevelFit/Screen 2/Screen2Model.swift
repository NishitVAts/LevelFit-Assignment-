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

struct ListModel:Identifiable{
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
    
    var id = UUID()
    var name:String
    var icon:String
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


