//
//  PlayerView.swift
//  lifecounter
//
//  Created by Megan on 4/21/21.
//

import SwiftUI
import Combine

struct PlayerView: View {
    var player: Int
    @Binding var lives: Int
    @Binding var playing: Bool
    @State private var livesToAdd = "5"
    @State private var livesToSub = "5"

    let colors: [Color] = [Color.red, Color.pink, Color.orange, Color.yellow, Color.green, Color.accentColor, Color.blue, Color.purple]

    var body: some View {
        VStack {
            // Player labels
            VStack {
                Text("Player \(player + 1)")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                Text("Lives: \(lives)")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            
            // Buttons
            HStack(alignment: .bottom) {
                // +/- 1 lives
                Button(action: {
                    lives = max(lives - 1, 0)
                    playing = true
                }) {
                    Text("-1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width: 55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                .disabled(lives == 0)
                
                Button(action: {
                    if (lives > 0) {
                        lives += 1
                        playing = true
                    }
                }) {
                    Text("+1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width:55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                .disabled(lives == 0)
            
                // - some number of lives
                VStack {
                    HStack {
                        Text("-")
                        TextField("5", text: $livesToSub)
                            .keyboardType(.numberPad)
                            .onReceive(Just(livesToSub)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.livesToSub = filtered
                                }
                            }
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            
                    }
                    .frame(width: 55.0, height: 25.0)
                
                    Button(action: {
                        lives = max(lives - Int(livesToSub)!, 0)
                        playing = true
                    }) {
                        Text("-" + livesToSub)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                    .padding(.vertical)
                    .frame(width: 55.0, height: 40)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    .disabled(lives == 0)
                }
                
                // + some number of lives
                VStack {
                    HStack {
                        Text("+")
                        TextField("5", text: $livesToAdd)
                            .keyboardType(.numberPad)
                            .onReceive(Just(livesToAdd)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.livesToAdd = filtered
                                }
                            }
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            
                    }
                    .frame(width: 55.0, height: 25.0)
                
                    Button(action: {
                        if (lives > 0) {
                            lives += Int(livesToAdd)!
                            playing = true
                        }
                    }) {
                        Text("+" + livesToAdd)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                    .padding(.vertical)
                    .frame(width: 55.0, height: 40)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    .disabled(lives == 0)
                }
            }

        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(lives > 0 ? colors[player] : Color.gray)
    }
}

struct TestPlayerView: View {
    var player: Int
    var lives: Int
    
    @State private var livesToAdd = "5"
    @State private var livesToSub = "5"
    
    let colors: [Color] = [Color.pink, Color.yellow, Color.green, Color.blue]
    
    var body: some View {
        VStack {
            // Player labels
            VStack {
                Text("Player \(player + 1)")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                Text("Lives: \(lives)")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            
            // Buttons
            HStack(alignment: .bottom) {
            // +/- 1 lives
                Button(action: {
//                    lives += 1
                }) {
                    Text("+1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width:55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            
                Button(action: {
//                    lives = max(lives - 1, 0)
                }) {
                    Text("-1")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical)
                .frame(width: 55.0, height: 40)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            
                // + some number of lives
                VStack {
                    HStack {
                        Text("+")
                        TextField("5", text: $livesToAdd)
                            .keyboardType(.numberPad)
                            .onReceive(Just(livesToAdd)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.livesToAdd = filtered
                                }
                            }
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            
                    }
                    .frame(width: 55.0, height: 25.0)
                
                    Button(action: {
//                    lives += 5
                    }) {
                        Text("+5")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                    .padding(.vertical)
                    .frame(width: 55.0, height: 40)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                }
                
                VStack {
                    HStack {
                        Text("-")
                        TextField("5", text: $livesToSub)
                            .keyboardType(.numberPad)
                            .onReceive(Just(livesToSub)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.livesToSub = filtered
                                }
                            }
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            
                    }
                    .frame(width: 55.0, height: 25.0)
                
                    Button(action: {
    //                    lives = max(lives - livesToSub, 0)
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

        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(colors[player])
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestPlayerView(player: 1, lives: 5)
        }
    }
}
