//
//  TodayMealModel.swift
//  BackToParentPageIssue
//
//  Created by Kavisha Sonaal on 23/09/21.
//

import Foundation

struct TodayMealModel: Identifiable {
    
    public var id: UUID = UUID()
    var mealId: UUID
    var name: String
    
}
