//
//  ContentView.swift
//  WeSplit
//
//  Created by Milo Wyner on 6/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            TextField("Amount", text: $checkAmount)
                .keyboardType(.decimalPad)
            
            Section {
                Text("$\(checkAmount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
