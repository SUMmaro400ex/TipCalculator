//
//  InterfaceController.swift
//  Tip 'n Split WatchKit Extension
//
//  Created by Jonathan on 10/19/15.
//  Copyright (c) 2015 JonComApps. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var labelString:String = ""
    var tapdNum:String = ""
    var decimalAdded:Bool = false
    var numAfterDecimal:Int = 0
    var billEntered:Bool = false
    var bill:Double = 0
    var dollarSign:String = "$"
    var numPeople:Double = 0
    var split:Double = 0
    let green:UIColor = UIColor.greenColor()
    let numberToSplit:String = "numberToSplit"
    
    @IBOutlet var displayLabel: WKInterfaceLabel!
    @IBAction func tapped0() {tappedNumber(0)}
    @IBAction func tapped1() {tappedNumber(1)}
    @IBAction func tapped2() {tappedNumber(2)}
    @IBAction func tapped3() {tappedNumber(3)}
    @IBAction func tapped4() {tappedNumber(4)}
    @IBAction func tapped5() {tappedNumber(5)}
    @IBAction func tapped6() {tappedNumber(6)}
    @IBAction func tapped7() {tappedNumber(7)}
    @IBAction func tapped8() {tappedNumber(8)}
    @IBAction func tapped9() {tappedNumber(9)}
    @IBAction func tappedDecimal() {addDecimal()}
    @IBAction func nextTapped() {tappedNext()}
    @IBOutlet var nextButton: WKInterfaceButton!
    @IBOutlet var decimalButton: WKInterfaceButton!

    func tappedNext(){
        if(billEntered){
            numPeople = Double(labelString)!
            split = bill/numPeople
            pushControllerWithName(numberToSplit, context: split)
        }
        else{
            billEntered = true
            bill = Double(labelString)!
            labelString = "Enter # Of People"
            updateDisplay()
            disableDecimal()
        }
    }

    func tappedNumber(num:Int){
        nextButton.setEnabled(true)
        nextButton.setBackgroundColor(green)
        tapdNum = String(num)
        if(checkDecimal()){
            labelStringUpdate(tapdNum)
        }
        else if(billEntered){
            if (labelString == "Enter # Of People"){
                labelString = ""
                updateDisplay()
            }
            labelStringUpdate(tapdNum)
        }
        return
    }
    
    func disableDecimal(){
        decimalButton.setEnabled(false)
        decimalButton.setBackgroundColor(UIColor.blackColor())
    }
    
    func checkDecimal()->Bool{
        if(decimalAdded){
            numAfterDecimal++
            if(numAfterDecimal > 2){
                return false
            }
        }
        return true
    }
    
    func updateDisplay(){
        if(billEntered){
            dollarSign=""
        }
            displayLabel.setText(dollarSign + labelString)
    }
    
    func addDecimal(){
        decimalAdded = true
        labelStringUpdate(".")
    }
    
    func labelStringUpdate(str:String){
        labelString = labelString.stringByAppendingString(str)
        updateDisplay()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
