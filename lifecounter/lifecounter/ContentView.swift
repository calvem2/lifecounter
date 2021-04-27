//
//  ContentView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lives : [Int] = [5, 5, 5, 5]
    @State private var isPortrait = true
    @State private var value = 4
    
    func incrementPlayers() {
        value = min(value + 1, 8)
        lives = [Int](repeating: 5, count: value)
    }
    
    func decrementPlayers() {
        value = max(value - 1, 2)
        lives = [Int](repeating: 5, count: value)
    }
    
    var body: some View {
        VStack {
            Stepper(onIncrement: incrementPlayers,
                     onDecrement: decrementPlayers) {
                Text("Players: \(value)")
                    .font(.title3)
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach((0..<value), id: \.self) { player in
                    PlayerView(player: player, lives: self.$lives[player])
                }
//                if (isPortrait) {
//                    ForEach((0..<value), id: \.self) { player in
//                        PlayerView(player: player, lives: self.$lives[player])
//                    }
////                    PlayerView(player: 0, lives: self.$lives[0])
////                    PlayerView(player: 1, lives: self.$lives[1])
////                    PlayerView(player: 2, lives: self.$lives[2])
////                    PlayerView(player: 3, lives: self.$lives[3])
//                } else {
//                    HStack {
//                        PlayerView(player: 0, lives: self.$lives[0])
//                        PlayerView(player: 1, lives: self.$lives[1])
//                    }
//                    HStack {
//                        PlayerView(player: 2, lives: self.$lives[2])
//                        PlayerView(player: 3, lives: self.$lives[3])
//                    }
//                }

                VStack {
                    ForEach(0..<lives.count) { player in
                        if (lives[player] <= 0) {
                            Text("Player \(player + 1) LOSES!")
                        }
                    }
                }
                .frame(height: 100)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                guard let scene = UIApplication.shared.windows.first?.windowScene else { return }
                self.isPortrait = scene.interfaceOrientation.isPortrait
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
