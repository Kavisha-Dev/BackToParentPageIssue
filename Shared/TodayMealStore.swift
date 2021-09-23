//
//  TodayMealStore.swift
//  BackToParentPageIssue
//
//  Created by Kavisha Sonaal on 23/09/21.
//

import Foundation

class TodayMealStore: ObservableObject {
    
    @Published var todaysMeals: [TodayMealModel] = []
    
    func fetch() {
        var todayList:[TodayMealModel] = []
        
        let number1 = Int.random(in: 100...500)
        let number2 = Int.random(in: 100...500)
        
        let m1 = TodayMealModel(mealId: UUID.init(), name: "Meal Data - \(number1)")
        todayList.append(m1)
        
        let m2 = TodayMealModel(mealId: UUID.init(), name: "Meal Data -  \(number2)")
        todayList.append(m2)
        
        self.todaysMeals = todayList
        //print("TodayMealStore fetch invoked!")
        
    }
}
