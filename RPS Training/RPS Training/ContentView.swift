//
//  ContentView.swift
//  RPS Training
//
//  Created by Ale Mohamad on 18/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    enum RPSOptions: String {
        case rock = "Rock"
        case paper = "Paper"
        case scissors = "Scissors"
    }
    
    let possibleMoves: [RPSOptions] = [.rock, .paper, .scissors]
    let possibleMovesEmoji = ["✊", "✋", "✌️"]
    
    @State private var appChoice = Int.random(in: 0...2)
    @State private var playerResult = Bool.random()
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(possibleMovesEmoji[appChoice])")
                    .font(.system(size: 100.0))
                    .padding(.bottom, 30.0)
                Text("If I choose “\(possibleMoves[appChoice].rawValue)”")
                    .font(.title)
                    .foregroundColor(.primary)
                Text(playerResult ? "and you have to win..." : "and you have to lose...")
                    .font(.title)
                    .foregroundColor(.secondary)
                Divider()
                    .padding(.vertical, 30.0)
                Text("What should be your choice?")
                    .fontWeight(.bold)
                HStack(spacing: 50.0) {
                    Button(action: {
                        self.checkSelection(move: .rock)
                    }) {
                        Text("\(RPSOptions.rock.rawValue)")
                    }
                    Button(action: {
                        self.checkSelection(move: .paper)
                    }) {
                        Text("\(RPSOptions.paper.rawValue)")
                    }
                    Button(action: {
                        self.checkSelection(move: .scissors)
                    }) {
                        Text("\(RPSOptions.scissors.rawValue)")
                    }
                }
                .padding(.top, 30.0)
            }
            .navigationBarTitle("RPS Training")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Game Over"),
                  message: Text("Your final score was \(gameScore).\nThanks for playing!"),
                  dismissButton: .default(Text("Play again")) {
                    self.resetGame()
                })
        }
    }
    
    func checkSelection(move: RPSOptions) {
        if currentRound == 10 {
            gameOver()
            return
        }
        
        switch possibleMoves[appChoice] {
        case .rock:
            if move == .paper {
                gameScore += playerResult ? 1 : -1;
            } else {
                gameScore += !playerResult ? 1 : -1;
            }
        case .paper:
            if move == .scissors {
                gameScore += playerResult ? 1 : -1;
            } else {
                gameScore += !playerResult ? 1 : -1;
            }
        case .scissors:
            if move == .rock {
                gameScore += playerResult ? 1 : -1;
            } else {
                gameScore += !playerResult ? 1 : -1;
            }
        }
        
        nextRound()
    }
    
    func nextRound() {
        appChoice = Int.random(in: 0...2)
        playerResult = Bool.random()
        currentRound += 1
    }
    
    func gameOver() {
        showAlert = true
    }
    
    func resetGame() {
        gameScore = 0
        currentRound = 0
        nextRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
