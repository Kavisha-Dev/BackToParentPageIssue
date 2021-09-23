//
//  ContentView.swift
//  Shared
//
//  Created by Kavisha Sonaal on 23/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todayMealStore: TodayMealStore = TodayMealStore()
    
    @StateObject private var evilObject = TimerStateObject()
    
    @State var index = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Doesnot return to this view when the timer refreshes this page
                if todayMealStore.todaysMeals.count > 0 {
                    NavigationLink(destination: SampleView01(mealCategoryName: todayMealStore.todaysMeals[0].name)) {
                        Text("Single Object: Tap me : \(todayMealStore.todaysMeals[0].name)")
                            .foregroundColor(.green)
                    }
                    .padding()
                }
                
                // Returns to this view when the timer refreshes this page. List also returns back.
                ForEach(todayMealStore.todaysMeals) { item in
                    NavigationLink(destination: SampleView01(mealCategoryName: item.name)) {
                        Text("ForEach item: Tap me : \(item.name)")
                            .foregroundColor(.green)
                    }
                    .padding()
                }
                
                // Doesnot return to this view when the timer refreshes this page
                NavigationLink(destination: SampleView02(name: "Another View")) {
                    Text("Tap me")
                }
                .padding()
            }
            .onAppear(perform: fetchTodaysMeals)
            .onChange(of: evilObject.changedNumber) { newValue in
                
                print("ContentView: onChange hit. New Meal Data fetched!")
                fetchTodaysMeals()
            }
        }
    }
    
    func fetchTodaysMeals() {
        todayMealStore.fetch()
    }
}

class TimerStateObject: ObservableObject {
    
    var timer: Timer?
    var changedNumber: Int = 0
    
    @Published var number: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            if Int.random(in: 1...3) == 1 {
                let num = Int.random(in: 100...500)
                self.number = num
                self.changedNumber = self.number
                //self.objectWillChange.send()
                
                print("*********** Timer invoked **************** ")
            }
        }
    }
}
