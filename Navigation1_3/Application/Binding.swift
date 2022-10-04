//
//  Binding.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 04.10.2022.
//

import Foundation

class Binding<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    var value: T {
        didSet{
            
        }
    }
    
    required init(value: T) {
        self.value = value
    }
    
    func startBind(_ listener: Listener?) {
        listener(value)
        self.listener = listener
    }
}
