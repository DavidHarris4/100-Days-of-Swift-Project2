//
//  ViewController.swift
//  Project2
//
//  Created by David Harris on 2/10/25.
// 3 Challenges:
// 1. Try showing the player’s score in the navigation bar, alongside the flag to guess. DONE
// 2. Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
// 3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
// WORK ON  CHALLENGE 2 and 3 
//
//
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreboard: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0
    var responsesGood = [String]()
    var responsesBad = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland",
        "russia", "spain", "uk", "us"]
        responsesGood += ["Great job!", "Good work!", "What a beast!", "Crushing it!", "Smarty pants!", "Look at you!"]
        responsesBad += ["Nice try!", "Wanna go again?", "Oof...", "Not quite!", "Try again!", "Nope!"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Tap the flag: \(countries[correctAnswer].uppercased())"
        scoreboard.text =  "Your score is: \(score) of \(questionCounter)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
    // Setting initial variables
        var incorrectAnswer = 0
        let buttonTapped = sender.tag
        
    // Creates buttonTapped variable for use in displaying the incorrect flag name
        
        if buttonTapped == correctAnswer {
            incorrectAnswer = correctAnswer
        } else {
            incorrectAnswer = buttonTapped
        }
        
    // Updates score and questionCounter variables and updates scoreboard text
            
        if sender.tag == correctAnswer && questionCounter != 10 {
            score += 1
            questionCounter += 1
        } else if sender.tag != correctAnswer && questionCounter != 10 {
            questionCounter += 1
        } else {
            questionCounter = 0
            score = 0
        }
        
        scoreboard.text =  "Your score is: \(score) of \(questionCounter)"
        
    // Sets alert window behavior and text
        
        let goGood = UIAlertController(title: "GAME OVER", message: "Your final score was \(score)", preferredStyle: .alert)
        goGood.addAction(UIAlertAction(title: "Start Over", style: .default, handler: askQuestion))
        
        let goBad = UIAlertController(title: "GAME OVER", message: "Give it another try! Your final score was \(score)!", preferredStyle: .alert)
        goBad.addAction(UIAlertAction(title: "Start Over", style: .default, handler: askQuestion))
        
        let acRight = UIAlertController(title: "CORRECT", message: "\(responsesGood.randomElement()!) You're \(score) for \(questionCounter).", preferredStyle: .alert)
        acRight.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        let acWrong = UIAlertController(title: "WRONG", message: "\(responsesBad.randomElement()!) That's the flag of \(countries[incorrectAnswer].uppercased()).", preferredStyle: .alert)
        acWrong.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
    // Triggers alert windows and resets counters for new game
        
        if sender.tag == correctAnswer && questionCounter != 10 {
            present(acRight, animated: true)
        } else if sender.tag != correctAnswer && questionCounter != 10 {
            present(acWrong, animated: true)
        } else if score == 10 && questionCounter == 10 {
            present(goGood, animated: true)
            scoreboard.text = "Final score: \(score) of 10"
            score = 0
            questionCounter = 0
        } else {
            present(goBad, animated: true)
            scoreboard.text = "Final score: \(score) of 10"
            score = 0
            questionCounter = 0
        }
    }
}

