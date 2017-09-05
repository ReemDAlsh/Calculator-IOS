//
//  ViewController.swift
//  Calculator
//
//  Created by Reem alsharif on 7/25/17.
//  Copyright © 2017 Reem alsharif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var show: UILabel!
    var userInMiddleOfTying = false
 //method
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
      
        
        if userInMiddleOfTying{
            let textdisaply = show!.text!
            show!.text = textdisaply + digit
        }else{
      
        
        show.text = digit
        userInMiddleOfTying = true
    }

}
    
    var showValue:Double{
        get{return Double(show.text!)!}
        set{show.text = String(newValue)}
    
    
    }
    
    private var b = BrainCal()

    @IBAction func operations(_ sender: UIButton) {
        if userInMiddleOfTying{
            b.setOperand(showValue)
            
        }
        
         userInMiddleOfTying = false
        if let ms = sender.currentTitle{
        b.performOperation(ms)
        
        
            
    }
        if let result = b.result{
        showValue =   result
        }
    
    
    
    }
    
    

}

