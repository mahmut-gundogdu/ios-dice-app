//
//  ViewController.swift
//  DiceApp
//
//  Created by Macbook on 16.05.2019.
//  Copyright © 2019 Mahmut Gundogdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundView = UIImageView()
    var dice1Index:Int = 0
    var dice2Index:Int = 0
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        updateDiceImage()
        // Do any additional setup after loading the view.
        
    
    }
    
    @IBAction func buttonClick() {
        updateDiceImage()
    }
    
    func updateDiceImage()  {
        var resultForDice1:Int
        var resultForDice2:Int
        repeat{
            resultForDice1 = randDiceNum()
            resultForDice2 = randDiceNum()
        } while dice1Index == resultForDice1 &&  dice2Index == resultForDice2
        dice1Index = resultForDice1
        dice2Index = resultForDice2
        
        setDice(dice1Index, dice2Index)
    }
    func randDiceNum() -> Int{
        return Int.random(in: 1...6)
    }
    
    func setDice(_ dice1Num:Int,_ dice2Num:Int){
        let image1 = UIImage(named:"dice\(dice1Num)")
        let image2 = UIImage(named:"dice\(dice2Num)")
        dice1.image = image1
        dice2.image = image2
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    
    func setBackground(){
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints  = false
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.image = UIImage(named: "background")
         view.sendSubviewToBack(backgroundView)
    }
    
    
}

