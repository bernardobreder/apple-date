//
//  DayTime.swift
//  Date
//
//  Created by Bernardo Breder on 15/12/16.
//
//

import Foundation

public class DayTime: Hashable, CustomStringConvertible {
    
    internal let _day: Int
    
    internal let _time: Int
    
    public convenience init() {
        self.init(date: Date())
    }
    
    public init(day: Int, month: Int, year: Int, hour: Int, minute: Int, second: Int) {
        _day = year * 10000 + month * 100 + day;
        _time = hour * 10000 + minute * 100 + second;
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
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        _day = year * 10000 + month * 100 + day;
        _time = hour * 10000 + minute * 100 + second;
    }
    
    public init(intValue: Int64) {
        _day = Int((intValue >> 32) & 0xFFFFFFFF)
        _time = Int(intValue & 0xFFFFFFFF)
    }
    
    public var day: Int {
        return _day - (_day / 10000) * 10000 - ((_day / 100) * 100 - (_day / 10000)
            * 10000)
    }
    
    public var month: Int {
        return _day / 100 - (_day / 10000) * 100
    }
    
    public var year: Int {
        return _day / 10000
    }
    
    public var hour: Int {
        return _time / 10000
    }
    
    public var minute: Int {
        return _time / 100 - (_time / 10000) * 100
    }
    
    public var second: Int {
        return _time - (_time / 10000) * 10000 - ((_time / 100) * 100 - (_time / 10000)
            * 10000)
    }
    
    public var components: (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        let year = _day / 10000
        let month = _day / 100 - year * 100
        let day = _day - year * 10000 - month * 100
        let hour = _time / 10000
        let minute = _time / 100 - hour * 100
        let second = _time - hour * 10000 - minute * 100
        return (year, month, day, hour, minute, second)
    }
    

    public var intValue: Int64 {
        return Int64(_day << 32) + Int64(_time)
    }
    
    public var date: Date? {
        let cmp = components
        var dateComponents = DateComponents()
        dateComponents.year = cmp.year
        dateComponents.month = cmp.month
        dateComponents.day = cmp.day
        dateComponents.hour = cmp.hour
        dateComponents.minute = cmp.minute
        dateComponents.second = cmp.second
        dateComponents.nanosecond = 0
        dateComponents.timeZone = GMT.timezone
        return Calendar.current.date(from: dateComponents)
    }
    
    public func format(date: DateFormatter.Style, time: DateFormatter.Style, timezone: TimeZone = GMT.timezone, locale: Locale = GMT.locale) -> String? {
        let formatter = DateFormatter()
        formatter.timeStyle = time
        formatter.dateStyle = date
        formatter.timeZone = timezone
        formatter.locale = locale
        guard let date = self.date else { return nil }
        return formatter.string(from: date)
    }
    
    public var hashValue: Int {
        return _day * 31 + _time
    }
    
    public static func ==(lhs: DayTime, rhs: DayTime) -> Bool {
        return lhs._time == rhs._time && lhs._day == rhs._day
    }
    
    public var description: String {
        let cmp = components
        return String(cmp.year) + "/" + String(cmp.month) + "/" + String(cmp.day) + " " + String(cmp.hour) + ":" + String(cmp.minute) + ":" + String(cmp.second)
    }
    
}
