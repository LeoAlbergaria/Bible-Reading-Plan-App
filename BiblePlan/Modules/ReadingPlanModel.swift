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
    
    init(section1: BibleSection, section2: BibleSection, isReaded: Bool = false) {
        self.section1 = section1
        self.section2 = section2
        self.isReaded = isReaded
    }
}

struct BibleSection: Codable {
    let book: String
    let firstChapter: String
    let lastChapter: String?
}
