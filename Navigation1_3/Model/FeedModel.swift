//
//  FeedModel.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.10.2022.
//

import UIKit

class FeedModel {
    
    static let shared = FeedModel()
    
    private init() {}
    
    var secretWord = "secretWord"
    
     private func check(_ word: String) -> Bool {
        return word == secretWord
    }
    
    func correctedWord(_ word: String) -> UILabel{
        
        let isCorrect: Bool = check(word)
        
        let correctWord = UILabel()
        guard isCorrect else {
            correctWord.text = "Неправильно"
            correctWord.textColor = .red
            return correctWord
            
        }
        correctWord.text = "Правильно"
        correctWord.textColor = .green
        return correctWord
    }
}

