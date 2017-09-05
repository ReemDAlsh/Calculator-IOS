//
//  calculator brain.swift
//  Calculator
//
//  Created by Reem alsharif on 7/27/17.
//  Copyright © 2017 Reem alsharif. All rights reserved.
//

import Foundation

import UIKit



private enum Op{
case constant(Double)
case unary((Double) -> Double)
case binaryOP((Double,Double)->Double)
case equals
case point()
case U(UIColor)


}

struct BrainCal{
    private var accumulator:Double?
    
    private var opreations: Dictionary<String,Op> = [
    "Pi": Op.constant(Double.pi),
    "e":  Op.constant(M_E),
    "f":  Op.unary(sqrt),
    "cos": Op.unary(cos),
    "sin": Op.unary(sin),
    "x": Op.binaryOP({$0 * $1}),
    "/": Op.binaryOP({$0 / $1}),
    "-": Op.binaryOP({$0 - $1}),
    "+": Op.binaryOP({$0 + $1}),
    "=": Op.equals,
    "bb": Op.U(UIColor.black)
   
        
    ]
    mutating func performOperation(_ symbol: String)  {
    
    
        if let opreation = opreations[symbol]{
            switch opreation {
            case .constant(let value):
                accumulator = value
                break
            case .unary(let fu):
                if accumulator != nil {
                accumulator = fu(accumulator!)
                }
                
            case.binaryOP(let funiction):
                if accumulator != nil{
                pendingBinaryOpreation = PendingBinaryOperation(function: funiction, firstOperand: accumulator!)
                  accumulator = nil
                }
               
            case .equals:
                PerformOperation()
          
                
                break
            
            
             default: break
            }
        
    }
    }
    
    
    private mutating func PerformOperation(){
        if pendingBinaryOpreation != nil && accumulator != nil{
            accumulator = pendingBinaryOpreation!.perform(with: accumulator!)
            pendingBinaryOpreation = nil
        }
    
    }
    
    private var pendingBinaryOpreation: PendingBinaryOperation?
    
    
    private struct PendingBinaryOperation{
        let function: (Double,Double)-> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    
    }
    mutating func setOperand(_ operand: Double)  {
        accumulator=operand
    }
    
    var result: Double?{
        get{
        
            return accumulator
        }
    
    }
    


}
