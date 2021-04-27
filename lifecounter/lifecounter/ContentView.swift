//
//  ContentView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lives : [Int] = [5, 5, 5, 5, 5, 5, 5, 5] {
        didSet {
//            if (playing) {
                print("hi")
//                var losses = 0;
//                for life in lives {
//                    if (life == 0) {
//                        losses += 1
//                    }
//                }
//                // reset app state
//                if (losses == lives.count - 1) {
//                    players = 4
//                    lives = [Int](repeating: 5, count: players)
//                    playing = false
//                }
//            }
        }
    }
//    @State private var isPortrait = true
    @State private var players = 4
    @State private var playing = false
    
    var body: some View {
        VStack {
            Text("Players: \(players)")
                .font(.title3)
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
//                .frame(height: 100)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
