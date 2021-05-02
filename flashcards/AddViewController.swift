//
//  AddViewController.swift
//  flashcards
//
//  Created by Cade Gardner on 9/11/20.
//  Copyright © 2020 Cade Gardner. All rights reserved.
//

import UIKit

struct GlobalFlashcards {
    static var FlashcardList = ["What is CS?"]
}

class AddViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    
    @IBAction func questionFieldChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty{
            questionLabel.text = text
        }else{
            questionLabel.text = "..."
        }
    }
    
    @IBAction func addFlashcard(_ sender: UIButton){
        if let question = questionTextField.text{
            FlashcardStore.shared.flashcards.append(question)
            questionTextField.text = ""
            questionLabel.text = "..."
        }
        if let answer = answerTextField.text{
            FlashcardStore.shared.answers.append(answer)
            answerTextField.text = ""
        }
        
        print("Submitted Question and Answer")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Add Controller has loaded")
        
    }
    
    // SINGLETON CODE - look at FlashcardStore.swift
//    if let text = myTextField.text{
//        FlashcardStore.shared.flashcards.append(text)
//    }
    
    
}
