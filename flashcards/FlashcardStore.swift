//
//  FlashcardStore.swift
//  flashcards
//
//  Created by Cade Gardner on 9/16/20.
//  Copyright © 2020 Cade Gardner. All rights reserved.
//

import Foundation

class FlashcardStore {
    
    static let shared = FlashcardStore()
    
    private init(){
        
    }
    
    var flashcards: [String] = ["What is Biology?", "What color is the sky?"]
    var answers: [String] = ["Study of life", "blue"]
}
