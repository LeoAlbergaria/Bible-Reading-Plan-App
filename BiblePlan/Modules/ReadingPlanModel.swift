//
//  ReadingPlanModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 16/02/24.
//

import Foundation

typealias ReadingPlan = [DailyReading]

struct DailyReading {
    let section1: BibleSection
    let section2: BibleSection
}

struct BibleSection {
    let book: String
    let firstChapter: Int
    let lastChapter: Int?
}

enum Book: String {
    case genesis = "Genesis"
    case exodus = "Exodus"
    case leviticus = "Leviticus"
    case numbers = "Numbers"
    case deuteronomy = "Deuteronomy"
    case joshua = "Joshua"
    case judges = "Judges"
    case ruth = "Ruth"
    case firstSamuel = "1 Samuel"
    case secondSamuel = "2 Samuel"
    case firstKings = "1 Kings"
    case secondKings = "2 Kings"
    case firstChronicles = "1 Chronicles"
    case secondChronicles = "2 Chronicles"
    case ezra = "Ezra"
    case nehemiah = "Nehemiah"
    case esther = "Esther"
    case job = "Job"
    case psalms = "Psalms"
    case proverbs = "Proverbs"
    case ecclesiastes = "Ecclesiastes"
    case songOfSolomon = "Song of Solomon"
    case isaiah = "Isaiah"
    case jeremiah = "Jeremiah"
    case lamentations = "Lamentations"
    case ezekiel = "Ezekiel"
    case daniel = "Daniel"
    case hosea = "Hosea"
    case joel = "Joel"
    case amos = "Amos"
    case obadiah = "Obadiah"
    case jonah = "Jonah"
    case micah = "Micah"
    case nahum = "Nahum"
    case habakkuk = "Habakkuk"
    case zephaniah = "Zephaniah"
    case haggai = "Haggai"
    case zechariah = "Zechariah"
    case malachi = "Malachi"
    case matthew = "Matthew"
    case mark = "Mark"
    case luke = "Luke"
    case john = "John"
    case acts = "Acts"
    case romans = "Romans"
    case firstCorinthians = "1 Corinthians"
    case secondCorinthians = "2 Corinthians"
    case galatians = "Galatians"
    case ephesians = "Ephesians"
    case philippians = "Philippians"
    case colossians = "Colossians"
    case firstThessalonians = "1 Thessalonians"
    case secondThessalonians = "2 Thessalonians"
    case firstTimothy = "1 Timothy"
    case secondTimothy = "2 Timothy"
    case titus = "Titus"
    case philemon = "Philemon"
    case hebrews = "Hebrews"
    case james = "James"
    case firstPeter = "1 Peter"
    case secondPeter = "2 Peter"
    case firstJohn = "1 John"
    case secondJohn = "2 John"
    case thirdJohn = "3 John"
    case jude = "Jude"
    case revelation = "Revelation"
}
