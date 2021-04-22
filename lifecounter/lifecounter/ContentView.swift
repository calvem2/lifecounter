//
//  ContentView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct ContentView: View {
//    @State private var lives: [Int];
//    var players: [Int] = [1, 2, 3, 4]
    
    @State private var lives : [Int] = [5, 5, 5, 5]
    
    var body: some View {
//        VStack {
//            ForEach(players) { player in
//                PlayerView(player: player)
//            }
//        }
        VStack {
            HStack(alignment: .top) {
                PlayerView(player: 0, lives: self.$lives[0])
                PlayerView(player: 1, lives: self.$lives[1])
            }
            .frame(maxWidth: .infinity)

            HStack(alignment: .top) {
                PlayerView(player: 2, lives: self.$lives[2])
                PlayerView(player: 3, lives: self.$lives[3])
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                ForEach(0..<lives.count) { player in
                    if (lives[player] <= 0) {
                        Text("Player \(player + 1) LOSES!")
                    }
                }
            }
            .frame(height: 100)
        }
//        .padding(.bottom, 100.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
