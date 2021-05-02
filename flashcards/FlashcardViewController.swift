//
//  ViewController.swift
//  flashcards
//
//  Created by Cade Gardner on 9/11/20.
//  Copyright © 2020 Cade Gardner. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    @IBOutlet var questionAsked: UILabel!
    @IBOutlet var userAnswer: UITextField!
    @IBOutlet var cardCount: UILabel!
    var currentIndex: Int = Int(arc4random_uniform(UInt32(FlashcardStore.shared.flashcards.count)))
    var usedCards: [Int] = []
    var currentCard: Int = 1
    var total: Int = 0
    
    @IBAction func submitAnswer(_ sender: UIButton){
        if let answer = userAnswer.text{
            if answer == FlashcardStore.shared.answers[currentIndex]{
                userAnswer.text = ""
                usedCards.append(currentIndex)
                currentIndex = Int(arc4random_uniform(UInt32(FlashcardStore.shared.flashcards.count)))
                if usedCards.count == FlashcardStore.shared.flashcards.count{
                    usedCards = []
                    currentCard = 0
                }
                var used: Int = 0
                while used != 1 {
                    if usedCards.contains(currentIndex){
                        currentIndex = Int(arc4random_uniform(UInt32(FlashcardStore.shared.flashcards.count)))
                        used = 0
                    }else{
                        currentCard += 1
                        cardCount.text = "\(currentCard) / \(total)"
                        used = 1
                    }
                }
                questionAsked.text = FlashcardStore.shared.flashcards[currentIndex]
                
            }
        }
    }
    
    @IBAction func fillAnswer(_ sender: UIButton){
        userAnswer.text = FlashcardStore.shared.answers[currentIndex]
    }
    
    @IBAction func skip(_ sender: UIButton){
        userAnswer.text = ""
        usedCards.append(currentIndex)
        currentIndex = Int(arc4random_uniform(UInt32(FlashcardStore.shared.flashcards.count)))
        if usedCards.count == FlashcardStore.shared.flashcards.count{
            usedCards = []
            currentCard = 0
        }
        var used: Int = 0
        while used != 1 {
            if usedCards.contains(currentIndex){
                currentIndex = Int(arc4random_uniform(UInt32(FlashcardStore.shared.flashcards.count)))
                used = 0
            }else{
                currentCard += 1
                cardCount.text = "\(currentCard) / \(total)"
                used = 1
            }
        }
        questionAsked.text = FlashcardStore.shared.flashcards[currentIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Flashcard Controller has loaded")
        
        total = FlashcardStore.shared.flashcards.count
        cardCount.text = "\(currentCard) / \(total)";
        questionAsked.text = FlashcardStore.shared.flashcards[currentIndex]
    }
    
    func viewDidAppear(){
        total = FlashcardStore.shared.flashcards.count
        cardCount.text = "\(currentCard) / \(total)";
        questionAsked.text = FlashcardStore.shared.flashcards[currentIndex]
    }

}

