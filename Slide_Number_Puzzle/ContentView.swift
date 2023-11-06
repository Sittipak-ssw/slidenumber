//
//  ContentView.swift
//  Slide_Number_Puzzle
//
//  Created by Sittipak Srisawas on 4/11/2566 BE.
//

import SwiftUI

struct SlideNumberPuzzleView: View {
    @StateObject var game = SlideNumberPuzzleGame()
    
    var body: some View {
        VStack {
            Text("Slide Number Puzzle")
                .font(.largeTitle)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 5) {
                ForEach(0..<16, id: \.self) { index in
                    PuzzleTileView(number: game.tiles[index])
                        .onTapGesture {
                            game.moveTile(at: index)
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
