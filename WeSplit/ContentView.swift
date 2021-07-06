//
//  ContentView.swift
//  WeSplit
//
//  Created by Milo Wyner on 6/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var total: Double {
        guard let check = Double(checkAmount) else { return 0 }
        let tip = check * Double(tipPercentages[tipPercentage]) / 100
        
        return check + tip
    }
    
    var totalPerPerson: Double {
        guard let people = Int(numberOfPeople) else { return 0 }
        return total / Double(people)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                TextField("Number of people", text: $numberOfPeople)
                
                Section(header: Text("How much tip do you want to leave?").textCase(nil)) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total").textCase(nil)) {
                    Text("$\(total, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .primary)
                }
                
                Section(header: Text("Amount per person").textCase(nil)) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
