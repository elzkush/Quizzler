//
//  ViewController.swift
//  Quizzler
//
//  Created by Elzada Kushbakova on 4/7/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var questions: [Questions] = [.one, .two, .three]
    var userAnswers: [String] = []
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        initialQuestions()
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         restart()
    }
    func makeCornerView(view: UIView, cornerRadius: CGFloat){
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
    }
    
    func setup(){
        makeCornerView(view: noButton, cornerRadius: 15)
        makeCornerView(view: yesButton, cornerRadius: 15)
        makeCornerView(view: view1, cornerRadius: 5)
        makeCornerView(view: view2, cornerRadius: 5)
        makeCornerView(view: view3, cornerRadius: 5)
        makeCornerView(view: mainView, cornerRadius: 30)
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1)
    }
    
    func initialQuestions(){
        mainLabel.text = questions[counter].title
        navigationItem.title = "Question № \(counter + 1)"
        view1.backgroundColor = .blue
        changeViewsBG()
    }
    
    func changeViewsBG(){
        switch counter{
        case 0:
            view1.backgroundColor = .blue
        case 1:
            view2.backgroundColor = .blue
        case 2:
            view3.backgroundColor = .blue
        default:
            print("Hello")
        }
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            userAnswers.insert("No", at: counter)
        case 2:
            userAnswers.insert("Yes", at: counter)
        default:
            print("Hello")
        }
        
        if questions.count - 1 == counter{
            print(userAnswers)
            navigationItem.title = "Quiz"
            let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            vc.result = ("\(checkCorrectAnswers())","\(counter + 1)")
            navigationController?.pushViewController(vc, animated: true)
            //Mark How to push next Vc 
        }else{
            counter += 1
            initialQuestions()
        }
    }
    
    func checkCorrectAnswers() -> String{
        var correctAnswers: Int = 0
        for i in 0..<questions.count{
            if userAnswers[i] == questions[i].answers{
                correctAnswers += 1
            }
        }
        return "\(correctAnswers)"
    }
    
    func restart(){
        userAnswers = []
        counter = 0
        view2.backgroundColor = .white
        view3.backgroundColor = .white
        mainLabel.text = questions[counter].title
    }
    
}


