//
//  PlayerView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI

struct PlayerView: View {
    var player: Int
    @Binding var lives: Int
    
    let colors: [Color] = [Color.pink, Color.yellow, Color.green, Color.blue]
    
    var body: some View {
        VStack {
            HStack {
                Text("Player \(player + 1)")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                Text("Lives: \(lives)")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            
            HStack {
                Button(action: {
                    lives += 1
                }) {
                    Text("+1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width:55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    lives = max(lives - 1, 0)
                }) {
                    Text("-1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width: 55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    lives += 5
                }) {
                    Text("+5")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width: 55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    lives = max(lives - 5, 0)
                }) {
                    Text("-5")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width: 55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)

            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(colors[player])
    }
}
