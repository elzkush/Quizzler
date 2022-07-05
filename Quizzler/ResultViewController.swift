//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Elzada Kushbakova on 4/7/22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    
    var result: (correctAnswer: String, totalQuestion: String) = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Quiz"
        navigationItem.title = "Result"
        navigationController?.navigationItem.leftBarButtonItem?.title = "Hello"
        navigationController?.navigationItem.title = "Result"
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        setup()
        getData()
    }

    func setup(){
        adviceLabel.layer.cornerRadius = 20
        adviceLabel.layer.masksToBounds = true
        repeatButton.layer.cornerRadius = 15
        repeatButton.layer.masksToBounds = true
    }
    
    func getData(){
        resultLabel.text = "\(result.correctAnswer) / \(result.totalQuestion)"
        
        if let number = Int(result.correctAnswer), let questions = Int(result.totalQuestion){
            if number == 0 {
                adviceLabel.text = "go to the Library"
            }else if number > 0 && number < questions{
                adviceLabel.text = "Not bad"
            }else if number == questions {
                adviceLabel.text = "Perfect"
            }
        }
    }
     
    @IBAction func repeatButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
