//
//  SlideNumberPuzzleGame.swift
//  Slide_Number_Puzzle
//
//  Created by Sittipak Srisawas on 4/11/2566 BE.
//
import SwiftUI

class SlideNumberPuzzleGame: ObservableObject {
    @Published var puzzles: [Int] = Array(1...15) + [0].shuffled()
    @Published var moves: Int = 0
    
    func shufflePuzzles() {
        puzzles.shuffle()
        moves = 0
       }
    
    func isWinning() -> Bool {
        return puzzles == Array(1...15) + [0] 
    }
    
    
    func movePuzzle(at index: Int) {
        if isAdjacentEmpty(index) {
            puzzles.swapAt(index, emptyPuzzlesIndex())
            moves += 1
        }
    }
    
    private func isAdjacentEmpty(_ index: Int) -> Bool {
        let emptyIndex = emptyPuzzlesIndex()
        return (index == emptyIndex - 1 && index % 4 != 3) ||
               (index == emptyIndex + 1 && index % 4 != 0) ||
               index == emptyIndex - 4 ||
               index == emptyIndex + 4
    }
    
    private func emptyPuzzlesIndex() -> Int {
        return puzzles.firstIndex(of: 0) ?? 0
    }
}
