//
//  GMT.swift
//  Date
//
//  Created by Bernardo Breder on 03/01/17.
//
//

import Foundation

public class GMT {
    
    public static var timezone: TimeZone {
        return NSTimeZone.`default`
    }
    
    public static var locale: Locale = Locale.current
    
    public static var timezoneHour: Int {
        return timezone.secondsFromGMT() / 60 / 60
    }
    
    public class func timezonePtBR() {
        if let timezone = TimeZone(abbreviation: "pt_BR") {
            NSTimeZone.`default` = timezone
        }
    }
    
    public class func timezoneUTC() {
        if let timezone = TimeZone(abbreviation: "UTC") {
            NSTimeZone.`default` = timezone
        }
    }

    public class func localePtBR() {
        locale = Locale(identifier: "pt_BR")
    }
    
    public class func localeEnUS() {
        locale = Locale(identifier: "en_US")
    }

}
