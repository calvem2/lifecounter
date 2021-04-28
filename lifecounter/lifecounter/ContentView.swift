//
//  ContentView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lives : [Int] = [5, 5, 5, 5, 5, 5, 5, 5]
    @State private var gameOver : Bool = false
    @State private var winner : Int = -1
    
    func checkGameStatus() {
        var losses = 0;
        if (playing) {
            print("hi")
            for i in 0..<players {
                if (lives[i] == 0) {
                    losses += 1
                }
            }
            
            // reset app state if game over
            if (losses == players - 1) {
                players = 4
                winner = lives.firstIndex(where: { $0 != 0 })! + 1
                lives = [Int](repeating: 5, count: 8)
                playing = false
                gameOver = true
            }
        }
    }
    
    
    
//    @State private var isPortrait = true
    @State private var players = 4
    @State private var playing = false
    
    var body: some View {
        VStack {
            // switch views
            Button(action: {
                print("pushed")
//                playerInfo[0].lives += 1
            }) {
                Text("history")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
            }
            
            Text("Players: \(players)")
                .font(.title3)
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
                    PlayerView(player: player, lives: self.$lives[player])
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
            .onChange(of: lives) { value in
                print(value)
                playing = true
                checkGameStatus()
            }
            .alert(isPresented: $gameOver) {
                Alert(title: Text("Game over!"), message: Text("Player \(winner) won"), dismissButton: .default(Text("Play again!")))
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
