//
//  BillInterfaceController.swift
//  Tip 'n Split
//
//  Created by Jonathan Rose on 11/15/15.
//  Copyright © 2015 JonComApps. All rights reserved.
//

import WatchKit
import Foundation


class BillInterfaceController: WKInterfaceController {
    
    var bill:String = ""
    @IBOutlet var billLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        bill = String(context)
        billLabel.setText(bill)
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
