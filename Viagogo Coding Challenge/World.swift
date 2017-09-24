//
//  World.swift
//  Viagogo Coding Challenge
//
//  Created by Yael Mahgerefteh on 23/09/2017.
//  Copyright © 2017 Yael Mahgerefteh. All rights reserved.
//

import Foundation

public class World : NSObject {
    
    var events = [Event]()
    var xCurrentLocation : Int = 0
    var yCurrentLocation : Int = 0
    
    
    init(events: [Event]){
        
        super.init()
        
        self.events = events
        
    }
    
    
    class func createWorld() -> World {
        
        // a world has 6 - 50 events
        let numberOfEvents = Int(arc4random_uniform(44)) + 6
        var events = [Event]()
        
        // creating 6 - 50 events
        for _ in 0 ..< numberOfEvents {
            events.append(Event.createEvent())
        }
        
        // a coordinate can only contain one event, so a new event is generated if there is a clash
        for i in 0 ..< numberOfEvents {
            while hasClash(events: events, index: i) {
                events[i] = Event.createEvent()
            }
        }
        return World(events: events)
        
    }
    
    
    private class func hasClash(events: [Event], index: Int) -> Bool {
        
        //compairing every event in the world with the current event to see if there is a clash
        for i in 0 ..< events.count {
            if(i != index) {
                if (events[i].xCoordinate == events[index].xCoordinate && events[i].yCoordinate == events[index].yCoordinate) {
                    return true
                }
            }
        }
        return false
    }
    
    
    func manhattanDistanceToEvent(event: Event) -> Int{
        return manhattanDistance(x1: xCurrentLocation, x2: event.xCoordinate, y1: yCurrentLocation, y2: event.yCoordinate)
    }
    
    
    private func manhattanDistance(x1: Int, x2: Int, y1: Int, y2: Int) -> Int {
        return mod(x1 - x2) + mod(y1 - y2)
    }
    
    
    private func mod(_ n: Int) -> Int {
        return n < 0 ? n * -1 : n
    }
    
    
    func nearest5Events() -> [Event] {
        
        //appends event and distance to distance array
        var distanceArr = self.events.map { (event) -> (event:Event, distance:Int) in
            return (event, manhattanDistanceToEvent(event: event))
        }
        
        //sorts distance array in ascending order
        distanceArr = distanceArr.sorted {$0.distance < $1.distance}
        
        //returns first 5 closest events
        return distanceArr[0...4].map({ (tuple) -> Event in
            return tuple.event
        })
        
    }
    
}
