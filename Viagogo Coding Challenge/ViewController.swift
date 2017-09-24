//
//  ViewController.swift
//  Viagogo Coding Challenge
//
//  Created by Yael Mahgerefteh on 23/09/2017.
//  Copyright © 2017 Yael Mahgerefteh. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    @IBOutlet weak var xCoordinateTextField: NSTextField!
    @IBOutlet weak var yCoordinateTextField: NSTextField!
    
    @IBOutlet weak var xCoordinateErrorLabel: NSTextField!
    @IBOutlet weak var yCoordinateErrorLabel: NSTextField!
    
    @IBOutlet weak var resultText: NSTextField!
    
    @IBOutlet weak var graphContainer: NSView!
    
    var display : GraphView!
    
    @IBAction func submit(_ sender: Any) {
        
        let xCoordinateString = xCoordinateTextField.stringValue
        let yCoordinateString = yCoordinateTextField.stringValue
        
        var xCoordinateValid = false
        var yCoordinateValid = false
        
        
        //check if coordinate text field is empty
        if(xCoordinateString.isEmpty){
            xCoordinateErrorLabel.stringValue = "Please enter your x coordinates"
            xCoordinateErrorLabel.isHidden = false
            xCoordinateValid = false
            resultText.isHidden = true
            graphContainer.isHidden = true
        }
        
        if(yCoordinateString.isEmpty){
            yCoordinateErrorLabel.stringValue = "Please enter your y coordinates"
            yCoordinateErrorLabel.isHidden = false
            yCoordinateValid = false
            resultText.isHidden = true
            graphContainer.isHidden = true
        }
        
        //check if coordinate is an integer and in range -10 to 10
        let xCoordinateInt = Int(xCoordinateString)
        let yCoordinateInt = Int(yCoordinateString)
        
        if(xCoordinateInt == nil){
            xCoordinateErrorLabel.stringValue = "Please make sure your x coordinate is an integer"
            xCoordinateErrorLabel.isHidden = false
            xCoordinateValid = false
            resultText.isHidden = true
            graphContainer.isHidden = true
        } else {
            if(xCoordinateInt! > 10 || xCoordinateInt! < -10) {
                xCoordinateErrorLabel.stringValue = "Please make sure your x coordinate is between -10 and 10"
                xCoordinateErrorLabel.isHidden = false
                xCoordinateValid = false
                resultText.isHidden = true
                graphContainer.isHidden = true
            } else {
                xCoordinateValid = true
                xCoordinateErrorLabel.isHidden = true
                graphContainer.isHidden = true
            }
        }
        
        if(yCoordinateInt == nil){
            yCoordinateErrorLabel.stringValue = "Please make sure your y coordinate is an integer"
            yCoordinateErrorLabel.isHidden = false
            yCoordinateValid = false
            resultText.isHidden = true
            graphContainer.isHidden = true
        } else {
            if(yCoordinateInt! > 10 || yCoordinateInt! < -10) {
                yCoordinateErrorLabel.stringValue = "Please make sure your y coordinate is between -10 and 10"
                yCoordinateErrorLabel.isHidden = false
                yCoordinateValid = false
                resultText.isHidden = true
                graphContainer.isHidden = true
            } else {
                yCoordinateValid = true
                yCoordinateErrorLabel.isHidden = true
                graphContainer.isHidden = true
                
            }
        }
        
        // if both coordinates are correct format, run program
        if(xCoordinateValid && yCoordinateValid) {
            graphContainer.isHidden = false
            
            let world = World.createWorld()
        
            world.xCurrentLocation = xCoordinateInt!
            world.yCurrentLocation = yCoordinateInt!
            
            var nearest5Events = world.nearest5Events()
            
           // generating nearest 5 events message
            var string = ""
            for i in 0 ..< nearest5Events.count {
                let price = nearest5Events[i].cheapestTicketPrice ?? 0
                var priceString = ""
                
                if(price == 0) {
                    priceString = "no tickets"
                } else {
                    priceString = String(format: "$%.2f", nearest5Events[i].cheapestTicketPrice!)
                }
                let id = nearest5Events[i].id
                let distance = world.manhattanDistanceToEvent(event: nearest5Events[i])
                string = String(format: "%i - \(priceString), Distance %i \n", id, distance) + string
            }
            
            resultText.stringValue = string
            
            resultText.isHidden = false
            
            setDisplay()
            
            // setting frame of graph
            let frame = CGRect(x: self.view.frame.origin.x + 50, y: self.view.frame.origin.y + 50, width: self.view.frame.width-10, height: self.view.frame.height-10)
            
            // passing current location to draw point
            display.x = xCoordinateInt!
            display.y = yCoordinateInt!
            
            // passing nearest event coordinates to draw points
            for i in 0..<nearest5Events.count {
                display.nearestX.append(nearest5Events[i].xCoordinate)
                display.nearestY.append(nearest5Events[i].yCoordinate)
                
            }
            
            // passing event coordinates to draw points
            for i in 0..<world.events.count {
                display.eventsX.append(world.events[i].xCoordinate)
                display.eventsY.append(world.events[i].yCoordinate)
            }
            
            display.draw(frame)
        }

    }
    
    func setDisplay() {
        display = GraphView(frame: graphContainer.frame)
        display.wantsLayer = true

        
        let views = ["graph" : display]
        
        display.translatesAutoresizingMaskIntoConstraints = false
        
        // adding graph drawn to graph container
        graphContainer.addSubview(display)
        
        // setting graph drawn to fill graph container
        graphContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[graph]|", options: [], metrics: nil, views: views))
        graphContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[graph]|", options: [], metrics: nil, views: views))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

