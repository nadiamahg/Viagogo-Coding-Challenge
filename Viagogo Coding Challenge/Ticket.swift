//
//  Ticket.swift
//  Viagogo Coding Challenge
//
//  Created by Yael Mahgerefteh on 23/09/2017.
//  Copyright © 2017 Yael Mahgerefteh. All rights reserved.
//

import Foundation

let karc4randomMax = Double(UInt32.max)

public class Ticket : NSObject {
    
    var ticketPrice : Double = 0
    
    
    init(ticketPrice : Double){
        super.init()
        
        self.ticketPrice = ticketPrice
        
    }
    
    
    class func createTicket() -> Ticket {
        
        //this gives a random number from 0 to 1
        let randomNumber0to1 = Double(arc4random()) / karc4randomMax
        
        //this gives a random price from 1 to 300 US dollars to 2 decimal places
        let price = Double(round(((randomNumber0to1 * 299) + 1)*100)/100)
        
        return Ticket(ticketPrice: price)
        
    }
    
}
