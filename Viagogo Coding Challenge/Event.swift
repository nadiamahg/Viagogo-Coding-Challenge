//
//  Event.swift
//  Viagogo Coding Challenge
//
//  Created by Yael Mahgerefteh on 23/09/2017.
//  Copyright © 2017 Yael Mahgerefteh. All rights reserved.
//

import Foundation

var lastEventId = 0

public class Event : NSObject {
    
    var id = 0
    var tickets : [Ticket]!
    
    var xCoordinate = 0
    var yCoordinate = 0
    
    var cheapestTicketPrice : Double? {
        
        // an event can have 0 tickets
        if(tickets.count == 0) {
            return nil
        }
        
        // if an event has multiple tickets, find the cheapest ticket
        var cheapestTicketPrice = tickets[0].ticketPrice
        for ticket in tickets {
            if (ticket.ticketPrice < cheapestTicketPrice){
                cheapestTicketPrice = ticket.ticketPrice
            }
        }
        return cheapestTicketPrice
        
    }
    
    
    init(id: Int, tickets : [Ticket], xCoordinate : Int, yCoordinate : Int){
        
        super.init()
        
        self.tickets = tickets
        self.xCoordinate = xCoordinate
        self.yCoordinate = yCoordinate
        self.id = id
        
    }
    
    
    class func createEvent() -> Event {
        
        // an event can have 0 - 10 tickets
        let numberOfTickets = Int(arc4random_uniform(10))
        
        // an event can have an x coordinate of -10 to 10 and y coordinate of -10 to 10
        let xCoordinate = Int(arc4random_uniform(20)) - 10
        let yCoordinate = Int(arc4random_uniform(20)) - 10
        
        // creating the tickets for each event
        var tickets = [Ticket]()
        for _ in 0 ..< numberOfTickets {
            tickets.append(Ticket.createTicket())
        }
        
        // setting the event id in ascending order
        let id = lastEventId
        lastEventId = lastEventId + 1
        
        return Event(id: id, tickets: tickets, xCoordinate: xCoordinate, yCoordinate: yCoordinate)
        
    }
    
}
