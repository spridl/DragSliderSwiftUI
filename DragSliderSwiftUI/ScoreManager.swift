//
//  ScoreManager.swift
//  DragSliderSwiftUI
//
//  Created by Тимур on 23.05.2022.
//

import Foundation

class ScoreManager {
    static let score = ScoreManager()
    
    private init() {}
    
    func computeScore(from targetValue: Int, and currentValue: Double) -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}
