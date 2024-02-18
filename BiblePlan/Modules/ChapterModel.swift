//
//  ChapterModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 16/02/24.
//

import Foundation

struct DailyPlan {
  let plan1: Section
  let plan2: Section
  let isReflexion: Bool = false
}

struct Section {
  let book: Book
  let firstChapter: Chapter
  let endingChapter: Chapter?
  
  init(book: Book, firstChapter: Chapter, endingChapter: Chapter? = nil) {
    self.book = book
    self.firstChapter = firstChapter
    self.endingChapter = endingChapter
  }
}

struct Chapter {
  let chapter: Int
  let verses: [Int]?
  
  init(chapter: Int, verses: [Int]? = nil) {
    self.chapter = chapter
    self.verses = verses
  }
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

class ReadingPlan {
    static let shared = ReadingPlan()
    
    private let readingPlan: [DailyPlan]
    
    private init() {
        self.readingPlan = [
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 1), endingChapter: Chapter(chapter: 2)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 1))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 3), endingChapter: Chapter(chapter: 5)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 2))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 6), endingChapter: Chapter(chapter: 9)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 3))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 10), endingChapter: Chapter(chapter: 11)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 4))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 12), endingChapter: Chapter(chapter: 14)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 5))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 15), endingChapter: Chapter(chapter: 17)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 6))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 18), endingChapter: Chapter(chapter: 20)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 7))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 21), endingChapter: Chapter(chapter: 23)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 8))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 24), endingChapter: Chapter(chapter: 26)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 9))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 27), endingChapter: Chapter(chapter: 29)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 10))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 30), endingChapter: Chapter(chapter: 32)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 11))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 33), endingChapter: Chapter(chapter: 36)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 12))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 37), endingChapter: Chapter(chapter: 39)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 13))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 40), endingChapter: Chapter(chapter: 42)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 14))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 43), endingChapter: Chapter(chapter: 46)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 15))),
          DailyPlan(plan1: Section(book: .genesis, firstChapter: Chapter(chapter: 47), endingChapter: Chapter(chapter: 50)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 16))),
          DailyPlan(plan1: Section(book: .mark, firstChapter: Chapter(chapter: 1), endingChapter: Chapter(chapter: 3)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 17))),
          DailyPlan(plan1: Section(book: .mark, firstChapter: Chapter(chapter: 4), endingChapter: Chapter(chapter: 6)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 18), endingChapter: Chapter(chapter: 24))),
          DailyPlan(plan1: Section(book: .mark, firstChapter: Chapter(chapter: 7), endingChapter: Chapter(chapter: 9)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 18, verses: [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50]))),
          DailyPlan(plan1: Section(book: .mark, firstChapter: Chapter(chapter: 10), endingChapter: Chapter(chapter: 12)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 19))),
          DailyPlan(plan1: Section(book: .mark, firstChapter: Chapter(chapter: 13), endingChapter: Chapter(chapter: 16)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 20))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 1), endingChapter: Chapter(chapter: 4)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 21))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 5), endingChapter: Chapter(chapter: 8)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 22, verses: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 9), endingChapter: Chapter(chapter: 11)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 22, verses: [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 12), endingChapter: Chapter(chapter: 14)), plan2: Section(book: .psalms, firstChapter: Chapter(chapter: 23))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 15), endingChapter: Chapter(chapter: 17)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 1))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 18), endingChapter: Chapter(chapter: 20)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 2))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 21), endingChapter: Chapter(chapter: 24)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 3))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 25), endingChapter: Chapter(chapter: 27)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 4))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 28), endingChapter: Chapter(chapter: 31)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 5))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 32), endingChapter: Chapter(chapter: 34)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 6))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 35), endingChapter: Chapter(chapter: 37)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 7))),
          DailyPlan(plan1: Section(book: .exodus, firstChapter: Chapter(chapter: 38), endingChapter: Chapter(chapter: 40)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 8))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 1), endingChapter: Chapter(chapter: 3)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 9))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 4), endingChapter: Chapter(chapter: 6)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 10, verses: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 7), endingChapter: Chapter(chapter: 9)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 10, verses: [17, 18, 19, 20, 21, 22, 23, 24, 25, 26]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 10), endingChapter: Chapter(chapter: 12)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 11, verses: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 13), endingChapter: Chapter(chapter: 15)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 11, verses: [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 16), endingChapter: Chapter(chapter: 18)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 12, verses: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 19), endingChapter: Chapter(chapter: 21)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 12, verses: [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 22), endingChapter: Chapter(chapter: 25)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 13))),
          DailyPlan(plan1: Section(book: .acts, firstChapter: Chapter(chapter: 26), endingChapter: Chapter(chapter: 28)), plan2: Section(book: .proverbs, firstChapter: Chapter(chapter: 13, verses: [13, 14, 15, 16])))
        ]
    }
    
    func getReadingPlan() -> [DailyPlan] {
        return readingPlan
    }
}

