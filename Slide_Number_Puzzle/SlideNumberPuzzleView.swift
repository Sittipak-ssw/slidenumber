//
//  SlideNumberPuzzleView.swift
//  Slide_Number_Puzzle
//
//  Created by Sittipak Srisawas 6410742032 and
//  Narathip Jaroensuk 6410742412 on 4/11/2566 BE.
//

import SwiftUI

struct SlideNumberPuzzleView: View {
    @StateObject var game = SlideNumberPuzzleGame()
    
    var body: some View {
        VStack {
            Text("New Game")
                .font(.system(size: 40, weight: .bold))
                .padding()
                .foregroundColor(.brown)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 5) {
                ForEach(0..<16, id: \.self) { index in
                    PuzzleTileView(number: game.puzzles[index])
                        .aspectRatio(3/3, contentMode: .fit)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                game.movePuzzle(at: index)
                            }

                        }
                }
                .foregroundColor(.orange)
            }
            Spacer()
            
            if game.isWinning() {
                Text("You Win!!")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.red)
                
                Button(action: {
                    game.restart()
                }) {
                    Text("Restart Game")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            Spacer()
           
            
            
            Text("Moves: \(game.moves)")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
            
        }
        .padding()
        .onAppear {
            game.shufflePuzzles()
        }
        
        
    }
}

struct PuzzleTileView: View {
    let number: Int
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                if number != 0 {
                    base.strokeBorder(lineWidth: 2)
                }
                
                Text(number == 0 ? "" : String(number))
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.orange)
                
            }
        }
    }
}
#Preview {
    SlideNumberPuzzleView()
}
