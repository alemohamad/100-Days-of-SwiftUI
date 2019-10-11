//
//  ContentView.swift
//  Challenge1
//
//  Created by Ale Mohamad on 11/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue = ""
    @State private var conversionUnitInput = 0
    @State private var conversionUnitOutput = 0
    
    let lengthOptions: [String] = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var convertedValue: Double {
        if let value = Double(initialValue) {
            let initial = Measurement(value: value, unit: lengthUnits[conversionUnitInput])
            return initial.converted(to: lengthUnits[conversionUnitOutput]).value
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value to convert", text: $initialValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose initial unit and conversion unit")) {
                    Picker("Select input unit", selection: $conversionUnitInput) {
                        ForEach(0 ..< lengthOptions.count) {
                            Text(self.lengthOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Picker("Select output unit", selection: $conversionUnitOutput) {
                        ForEach(0 ..< lengthOptions.count) {
                            Text(self.lengthOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(convertedValue, specifier: "%.2f") \(lengthOptions[conversionUnitOutput])")
                }
            }
            .navigationBarTitle("Lengthify")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
