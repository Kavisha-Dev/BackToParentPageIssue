//
//  DummyListView.swift
//  BackToParentPageIssue
//
//  Created by Kavisha Sonaal on 23/09/21.
//

import SwiftUI

struct SampleView02: View {
    
    //@ObservedObject var dummy: Dummy
    
    @StateObject var dummy: Dummy = Dummy()
    
    var name: String
    
    var body: some View {
        Text(name)
        Text(dummy.number)
            .onAppear(perform: editName)
    }
    
    
    func editName() {
        dummy.number = "Setting name to kavisha on appear"
    }
    
}


struct DummyListView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView02(dummy:  Dummy(), name: "")
    }
}

class Dummy: ObservableObject {
    @Published var number: String = "Reset to default = 0"
}
