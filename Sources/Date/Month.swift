//
//  Month.swift
//  Date
//
//  Created by Bernardo Breder on 15/12/16.
//
//

import Foundation

public class Month: Hashable, CustomStringConvertible {
    
    internal let time: Int
    
    public convenience init() {
        self.init(date: Date())
    }
    
    public convenience init?(dateString: String, format: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: dateString) else { return nil }
        self.init(date: date)
    }
    
    public init(month: Int, year: Int) {
        time = year * 100 + month;
    }
    
    public init(date: Date) {
        let calendar = NSCalendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        time = year * 100 + month;
    }
    
    public init(intValue time: Int) {
        self.time = time
    }

    public var month: Int {
        return time - (time / 100) * 100
    }
    
    public var year: Int {
        return time / 100
    }
    
    public var components: (year: Int, month: Int) {
        let year = time / 100
        let month = time - year * 100
        return (year, month)
    }
    
    public var intValue: Int {
        return time
    }
    
    public var firstDate: Date? {
        let cmp = components
        var dateComponents = DateComponents()
        dateComponents.year = cmp.year
        dateComponents.month = cmp.month
        dateComponents.day = 1
        dateComponents.timeZone = GMT.timezone
        return Calendar.current.date(from: dateComponents)
    }
    
    public var hashValue: Int {
        return time
    }
    
    public static func ==(lhs: Month, rhs: Month) -> Bool {
        return lhs.time == rhs.time
    }
    
    public var description: String {
        let cmp = components
        return String(cmp.year) + "/" + String(cmp.month)
    }
    
}
