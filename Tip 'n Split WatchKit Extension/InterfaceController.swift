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
    
    var labelString:String = "$"
    var tapdNum:String = ""
    
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
    
    func tappedNumber(num:Int){
        tapdNum = String(num)
        labelString = labelString.stringByAppendingString(tapdNum)
        displayLabel.setText(labelString)
    }
    
    @IBAction func tappedNext(){
        
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
