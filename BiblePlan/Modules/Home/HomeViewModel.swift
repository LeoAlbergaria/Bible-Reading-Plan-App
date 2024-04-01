//
//  HomeViewModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 15/02/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func loadData()
    
    var readingPlan: ReadingPlan { get }
}

class HomeViewModel: HomeViewModelProtocol {
    var readingPlan: ReadingPlan = []
    
    func loadData(){
        guard let fileURL = Bundle.main.url(forResource: "readingPlan", withExtension: "csv") else {
            fatalError("CSV file not found")
        }
        
        do {
            let csvString = try String(contentsOf: fileURL)
            var lines = csvString.components(separatedBy: .newlines)
            lines.removeFirst()
            lines.removeLast()
            
            for line in lines {
                let fields = line.components(separatedBy: ",")
                
                let book1 = fields[0]
                guard book1 != "off" else { continue }
                let chapter1First = Int(fields[1]) ?? 0
                let chapter1Last = Int(fields[2]) ?? 0
                let book2 = fields[3]
                let chapter2 = Int(fields[4]) ?? 0
                
                let section1 = BibleSection(book: book1, firstChapter: chapter1First, lastChapter: chapter1Last)
                let section2 = BibleSection(book: book2, firstChapter: chapter2, lastChapter: nil)
                let dailyReading = DailyReading(section1: section1, section2: section2)
                readingPlan.append(dailyReading)
            }
        } catch {
            print("Error reading CSV file: \(error)")
        }
    }
}


