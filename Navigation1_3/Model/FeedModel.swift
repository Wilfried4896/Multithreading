//
//  FeedModel.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.10.2022.
//

import Foundation

class FeedModel {
    
    var secretWord = "secretWord"
    
    func check(_ word: String) -> Bool {
        return word == secretWord
    }

}

