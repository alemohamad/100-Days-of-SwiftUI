//
//  ContentView.swift
//  WeSplit
//
//  Created by Ale Mohamad on 08/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
//    @State private var numberOfPeopleString = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
//        let orderAmount = Double(checkAmount) ?? 0
        
        var sanitisedAmount = checkAmount.replacingOccurrences(of: Locale.current.decimalSeparator ?? ".", with: ".")
        sanitisedAmount = sanitisedAmount.replacingOccurrences(of: Locale.current.groupingSeparator ?? "", with: "")
        let orderAmount = Double(sanitisedAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
//                    TextField("Number of people", text: $numberOfPeopleString)
//                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f") €")
                }
                
                Section(header: Text("Total amount")) {
                    Text("\(totalAmount, specifier: "%.2f") €")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .primary)
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
