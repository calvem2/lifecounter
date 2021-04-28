//
//  ContentView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lives : [Int] = [20, 20, 20, 20, 20, 20, 20, 20]
    @State private var gameOver : Bool = false
    @State private var winner : Int = -1
    @State private var history : [(player: Int, change: Int)] = []
    @State private var view : String = "game"
    
    func checkGameStatus() {
        var losses = 0;
        for i in 0..<players {
            if (lives[i] == 0) {
                losses += 1
            }
        }
        
        // reset app state if game over
        if (losses == players - 1) {
            players = 4
            winner = lives.firstIndex(where: { $0 != 0 })! + 1
            lives = [Int](repeating: 20, count: 8)
            history = []
            playing = false
            gameOver = true
        }
    }
    
    @State private var players = 4
    @State private var playing = false
    
    var body: some View {
        VStack {
            // switch views
            Button(action: {
                view = view == "game" ? "history" : "game"
            }) {
                Text("\(view == "game" ? "history" : "home")")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
            }
            
            Text("Players: \(players)")
                .font(.title3)
            
            Button(action: {
                players = 4
                lives = [Int](repeating: 20, count: 8)
                history = []
                playing = false
            }) {
                Text("reset game")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
            }
            
            // toggle game and history views
            if (view == "game") {
                // add/remove players
                if (!playing) {
                    HStack {
                        Button(action: {
                            if (!playing && players + 1 <= 8) {
                                players += 1
                            }
                        }) {
                            Text("add player")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.all)
                        .background(players < 8 ? /*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/ : Color.gray)
                        .disabled(players == 8 )
                        
                        Button(action: {
                            if (!playing && players - 1 >= 2) {
                                players -= 1
                            }
                        }) {
                            Text("remove player")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.all)
                        .background(players > 2 ? /*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/ : Color.gray)
                        .disabled(players == 2)
                    }
                    .padding(.horizontal)
                }
                
                // player views
                ScrollView {
                    ForEach((0..<players), id: \.self) { player in
                        PlayerView(player: player, lives: self.$lives[player], playing: $playing)
                    }

                    VStack {
                        ForEach((0..<players), id: \.self) { player in
                            if (lives[player] <= 0) {
                                Text("Player \(player + 1) LOSES!")
                            }
                        }
                    }
                }
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onChange(of: lives) { [lives] newState in
                    if (playing) {
                        for i in 0..<players {
                            if (lives[i] != newState[i]) {
                                history.append((player: i + 1, change: newState[i] - lives[i]))
                                break
                            }
                        }
                        checkGameStatus()
                    }
                }
                .alert(isPresented: $gameOver) {
                    Alert(title: Text("Game over!"), message: Text("Player \(winner) won"), dismissButton: .default(Text("Play again!")))
                }
            } else {
                HistoryView(history: history)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
