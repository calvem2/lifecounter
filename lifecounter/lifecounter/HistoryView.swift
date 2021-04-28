//
//  HistoryView.swift
//  lifecounter
//
//  Created by Megan on 4/27/21.
//

import SwiftUI

struct HistoryView: View {
    var history: [(player: Int, change: Int)]
    
    var body: some View {
        ScrollView {
            ForEach((0..<history.count), id: \.self) { move in
                Text("Player \(history[move].player) \(history[move].change < 0 ? "lost" : "gained") \(abs(history[move].change)) \(history[move].change > 1 ? "lives" : "life")")
    //            PlayerView(player: player, lives: self.$lives[player])
            }
        }
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
