//
//  HomeViewModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 15/02/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
  var plan: [DailyPlan] { get }
}

class HomeViewModel {
  let plan = ReadingPlan.shared.getReadingPlan()
}


