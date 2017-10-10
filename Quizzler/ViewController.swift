//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        
        if questionNumber < 12 {
            checkAnswer()
            questionNumber += 1
            print(questionNumber)
            nextQuestion()
        }
        else{
            
            let alert = UIAlertController(title: "Quiz ended", message: "Restart the game?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIActionAlert) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat( questionNumber + 1 )
    }
    

    func nextQuestion() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        updateUI()
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer{
            print("True")
            score += 10
        }
        else{
            print("False")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
        progressLabel.text = "\(questionNumber + 1)/13"
        score = 0
        scoreLabel.text = String("Score: 0" )
    }
    

    
}
