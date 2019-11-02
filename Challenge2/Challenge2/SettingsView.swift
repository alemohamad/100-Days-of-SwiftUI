//
//  SettingsView.swift
//  Challenge2
//
//  Created by Ale Mohamad on 02/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State private var multiplicationTableSelected = 0
    @State private var selectedManyQuestions = 0
    
    let questionsOptions = [5, 10, 20]
    
    var completion: (_ multiplication: Int, _ howManyQuestions: Int) -> ()
    
    var body: some View {
        Group {
            Text("Multi Play Cation")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 24.0)
            
            Group {
                Text("Choose the multiplication table")
                    .font(.headline)
                HStack(alignment: .center) {
                    MultiplicationView(number: 1) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 2) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 3) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 4) { pos in
                        self.multiplicationTableSelected = pos
                    }
                }
                HStack(alignment: .center) {
                    MultiplicationView(number: 5) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 6) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 7) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 8) { pos in
                        self.multiplicationTableSelected = pos
                    }
                }
                HStack(alignment: .center) {
                    MultiplicationView(number: 9) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 10) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 11) { pos in
                        self.multiplicationTableSelected = pos
                    }
                    MultiplicationView(number: 12) { pos in
                        self.multiplicationTableSelected = pos
                    }
                }
            }
            .padding(.bottom, 24.0)
            
            Text("How many questions?")
                .font(.headline)
            Picker("questions", selection: $selectedManyQuestions) {
                ForEach(0..<questionsOptions.count) {
                    Text("\(self.questionsOptions[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 24.0)
            
            Button(action: {
                self.completion(self.multiplicationTableSelected, self.questionsOptions[self.selectedManyQuestions])
            }) {
                Text((multiplicationTableSelected == 0) ? "Choose a table" : "Let's play with \(multiplicationTableSelected)!")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .disabled(multiplicationTableSelected == 0)
        }
    }
}

