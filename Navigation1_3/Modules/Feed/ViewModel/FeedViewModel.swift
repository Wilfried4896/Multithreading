//
//  FeedViewModel.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 04.10.2022.
//

import Foundation
import UIKit.UIColor

protocol FeedViewModelProtocol {
    var text: Binding<String> { get set }
    var color: Binding<UIColor> { get set }
}

class FeedViewModel: FeedViewModelProtocol {
    
    var text = Binding<String>("")
    var color = Binding<UIColor>(.white)
    
    let feedModel = FeedModel()
     private var isCorrect = false

    func didTapButton(_ word: String) {
        isCorrect = feedModel.check(word)
        
        guard isCorrect else {
            text.value = "Неправильно"
            color.value = .red
            return
        }
        text.value = "Правильно"
        color.value = .green
    }
    
}
