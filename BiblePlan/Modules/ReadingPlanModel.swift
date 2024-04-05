//
//  ReadingPlanModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 16/02/24.
//

import Foundation

typealias ReadingPlan = [DailyReading]

struct DailyReading: Codable {
    let section1: BibleSection
    let section2: BibleSection
    var isReaded: Bool
    let date: Date
    
    init(section1: BibleSection, section2: BibleSection, isReaded: Bool = false, date: Date) {
        self.section1 = section1
        self.section2 = section2
        self.isReaded = isReaded
        self.date = date
    }
}

struct BibleSection: Codable, CustomStringConvertible  {
    let book: String
    let firstChapter: String
    let lastChapter: String?
    
    var description: String {
        var text = "\(book) \(firstChapter)"
        if let lastChapter = lastChapter {
            text += " - \(lastChapter)"
        }
        return text
    }
}
