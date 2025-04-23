//
//  readline.swift
//  Sunset Blvd
//
//  Created by Ouimin Lee on 4/23/25.
//

import Foundation

func birthdaytostring() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

    let birthday = readLine() ?? "19990225"

    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "MMM dd"
    outputDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    outputDateFormatter.locale = Locale(identifier: "en_US_POSIX")

    if let date = dateFormatter.date(from: birthday) {
        print(outputDateFormatter.string(from: date))
    } else {
        print("Invalid date format")
    }
}
