//
//  Day.swift
//  Date
//
//  Created by Bernardo Breder on 14/12/16.
//
//

import Foundation

public class Day: Hashable, CustomStringConvertible {
    
    internal let time: Int
    
    public convenience init() {
        self.init(date: Date())
    }
    
    public init(day: Int, month: Int, year: Int) {
        time = year * 10000 + month * 100 + day;
    }
    
    public convenience init?(dateString: String, format: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: dateString) else { return nil }
        self.init(date: date)
    }
    
    public init(date: Date) {
        let calendar = NSCalendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        time = year * 10000 + month * 100 + day;
    }
    
    public init(intValue time: Int) {
        self.time = time
    }
    
    public var day: Int {
        return time - (time / 10000) * 10000 - ((time / 100) * 100 - (time / 10000)
            * 10000)
    }
    
    public var month: Int {
        return time / 100 - (time / 10000) * 100
    }
    
    public var year: Int {
        return time / 10000
    }
    
    public var components: (year: Int, month: Int, day: Int) {
        let year = time / 10000
        let month = time / 100 - year * 100
        let day = time - year * 10000 - month * 100
        return (year, month, day)
    }
    
    public var intValue: Int {
        return time
    }
    
    public var date: Date? {
        let cmp = components
        var dateComponents = DateComponents()
        dateComponents.year = cmp.year
        dateComponents.month = cmp.month
        dateComponents.day = cmp.day
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.nanosecond = 0
        dateComponents.timeZone = GMT.timezone
        var calendar = Calendar.current
        calendar.timeZone = GMT.timezone
        calendar.locale = GMT.locale
        return calendar.date(from: dateComponents)
    }
    
    public var hashValue: Int {
        return time
    }
    
    public static func ==(lhs: Day, rhs: Day) -> Bool {
        return lhs.time == rhs.time
    }
    
    public var description: String {
        let cmp = components
        return String(cmp.year) + "/" + String(cmp.month) + "/" + String(cmp.day)
    }
    
}
