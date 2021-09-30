//
//  ViewController.swift
//  Lab_4
//
//  Created by David Vicker on 9/29/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Sea_Biscut: UILabel!
    @IBOutlet weak var Fury: UILabel!
    @IBOutlet weak var Glue: UILabel!
    @IBOutlet weak var Uno: UILabel!
    @IBOutlet weak var Lucky: UILabel!
    @IBOutlet weak var Payout: UILabel!
    
    @IBOutlet weak var seaBiscutOdds: UILabel!
    @IBOutlet weak var furyOdds: UILabel!
    @IBOutlet weak var glueOdds: UILabel!
    @IBOutlet weak var unoOdds: UILabel!
    @IBOutlet weak var luckyOdds: UILabel!
    @IBOutlet weak var winningHorseNumber: UILabel!
    
    @IBOutlet weak var horsePickStepper: UIStepper!
    @IBOutlet weak var horsePick: UILabel!
    
    @IBOutlet weak var betAmount: UITextField!
    
    @IBAction func race(_ sender: UIButton) {
        //chooseWinningHorse()
        var winningHorse: Float
        
        winningHorse = Float.random(in: 1...5)
        
        winningHorse = round(winningHorse)
        
        winningHorseNumber.text = String(winningHorse)
        
        
        let playerPick = Float(horsePickStepper.value)
        var oddsAgainst: Float = 0.0
        var payout: Float = 0.0
     
        if Float(betAmount.text!)! > 0 {
            let bet = Float(betAmount.text!)!
            if winningHorse == playerPick{
                if winningHorse == 1 {
                    oddsAgainst = 100 - Float(seaBiscutOdds.text!)!
                    payout = oddsAgainst * bet
                    Payout.text = "You win: " + String(payout) + "$"
                }
                else if winningHorse == 2 {
                    oddsAgainst = 100 - Float(furyOdds.text!)!
                    payout = oddsAgainst * bet
                    Payout.text = "You win: " + String(payout) + "$"
                }
                else if winningHorse == 3 {
                    oddsAgainst = 100 - Float(glueOdds.text!)!
                    payout = oddsAgainst * bet
                    Payout.text = "You win: " + String(payout) + "$"
                }
                else if winningHorse == 4 {
                    oddsAgainst = 100 - Float(unoOdds.text!)!
                    payout = oddsAgainst * bet
                    Payout.text = "You win: " + String(payout) + "$"
                }
                else{
                    oddsAgainst = 100 - Float(luckyOdds.text!)!
                    payout = oddsAgainst * bet
                    Payout.text = "You win: " + String(payout) + "$"
                }
                
                
            }
            else{
                Payout.text = "You Lose Try Again"
            }
        }
        else{
            let alert=UIAlertController(title: "Warning", message: "You Must Place a bet greater than 0", preferredStyle: UIAlertController.Style.alert)
            let cancelAction=UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction=UIAlertAction(title: "OK", style:UIAlertAction.Style.default, handler: {action in
                //self.peopleStepper.value = 1
                //self.peopleLabel.text? = "1 person"
                //self.updateTipTotals()
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

        
        
        //var bet: Float = 0.0
        //bet = Float(betAmount.value)
        
        
        
    }
    
    //func chooseWinningHorse(){
        
        
    //}
    @IBAction func calculateOdds(_ sender: UIButton) {
        updateOdds()
    }
    // relabels the horse pick lable
    @IBAction func updatePick(_ sender: UIStepper) {
        if horsePickStepper.value == 1 {
            horsePick.text = "Horse 1.0"
        }
        else{
            horsePick.text = "Horse: " + String(horsePickStepper.value)
        }
    }
    
    func updateOdds(){
        
        var odds: Float
        
        odds = Float.random(in: 1...100)
        
        seaBiscutOdds.text = String(odds)
        
        var leftOver: Float
        leftOver = 100 - odds
        
        odds = Float.random(in: 1...leftOver)
        
        furyOdds.text = String(odds)
        
        leftOver = leftOver - odds
        
        odds = Float.random(in: 1...leftOver)
        
        glueOdds.text = String(odds)
        
        leftOver = leftOver - odds
        
        odds = Float.random(in: 0...leftOver)
        
        unoOdds.text = String(odds)
        
        leftOver = leftOver - odds
        
        luckyOdds.text = String(leftOver)
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //updateOdds()
    }
    
    func textFieldShouldReturn (_ textFeild: UITextField) -> Bool {
        textFeild.resignFirstResponder()
        return true
    }
    
    
    //let playerPick = horsePick.value
    

    override func viewDidLoad() {
        betAmount.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

