//
//  GraphView.swift
//  Viagogo Coding Challenge
//
//  Created by Yael Mahgerefteh on 23/09/2017.
//  Copyright © 2017 Yael Mahgerefteh. All rights reserved.
//

import Cocoa

class GraphView: NSView {

    var x = 0
    var y = 0
    
    var eventsX = [Int]()
    var eventsY = [Int]()
    
    var nearestX = [Int]()
    var nearestY = [Int]()
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        //background colour
        let yellowColour = NSColor.yellow
        yellowColour.set()
        
        let width = dirtyRect.size.width
        let height = dirtyRect.size.height
        let noHLines = 22;
        let noVLines = 22;
        let vSpacing = height / CGFloat(noHLines)
        let hSpacing = width / CGFloat(noVLines)
        
        //this clears display by drawing a thick line over drawing
        let backgroundPath = NSBezierPath()
        backgroundPath.lineWidth = width * 2
        backgroundPath.move(to: NSMakePoint(0, 0))
        backgroundPath.line(to: NSMakePoint(0 , height))
        
        backgroundPath.stroke()
        
        //grid line colour
        let blackColor = NSColor.black
        blackColor.set()
        
        //horizontal grid lines
        let bPath = NSBezierPath()
        bPath.lineWidth = 1.0
        for i in 1..<noHLines{
            let yVal = CGFloat(i) * vSpacing
            bPath.move(to: NSMakePoint(0, yVal))
            bPath.line(to: NSMakePoint(width , yVal))
        }
        bPath.stroke()
        
        //vertical grid lines
        for i in 1..<noVLines {
            let xVal = CGFloat(i) * hSpacing
            bPath.move(to: NSMakePoint(xVal, 0))
            bPath.line(to: NSMakePoint(xVal, height))
        }
        bPath.stroke()
        
        // thicker 0,0 lines
        let cPath = NSBezierPath()
        cPath.lineWidth = 3.0
        let xVal = CGFloat(11) * hSpacing
        cPath.move(to: NSMakePoint(xVal, 0))
        cPath.line(to: NSMakePoint(xVal, height))
        let yVal = CGFloat(11) * vSpacing
        cPath.move(to: NSMakePoint(0, yVal))
        cPath.line(to: NSMakePoint(width , yVal))
        cPath.stroke()
        
        // thicker border lines
        let xborderVal = CGFloat(1) * hSpacing
        cPath.move(to: NSMakePoint(xborderVal, 0))
        cPath.line(to: NSMakePoint(xborderVal, height))
        cPath.stroke()
        let yborderVal = CGFloat(1) * vSpacing
        cPath.move(to: NSMakePoint(0, yborderVal))
        cPath.line(to: NSMakePoint(width , yborderVal))
        cPath.stroke()
        let xborderVal2 = CGFloat(21) * hSpacing
        cPath.move(to: NSMakePoint(xborderVal2, 0))
        cPath.line(to: NSMakePoint(xborderVal2, height))
        cPath.stroke()
        let yborderVal2 = CGFloat(21) * vSpacing
        cPath.move(to: NSMakePoint(0, yborderVal2))
        cPath.line(to: NSMakePoint(width , yborderVal2))
        cPath.stroke()
        
        //passing event coordinates to draw points
        for i in 0..<eventsX.count{
            drawPoints(xCoordinate: eventsX[i], yCoordinate: eventsY[i], frame: frame, colour: NSColor.green)
        }
        
        //passing nearest coordinates to draw points
        for i in 0..<nearestX.count{
            drawPoints(xCoordinate: nearestX[i], yCoordinate: nearestY[i], frame: dirtyRect, colour: NSColor.red)
        }
        
        //passing current location to draw points
        drawPoints(xCoordinate: self.x, yCoordinate: self.y, frame: dirtyRect, colour: NSColor.blue)
        
    }
    
    
    func drawPoints(xCoordinate: Int, yCoordinate: Int, frame: NSRect, colour: NSColor) {
        
        let colour = colour
        colour.set()
        
        let width = frame.size.width
        let height = frame.size.height
        let noHLines = 21;
        let noVLines = 21;
        let vSpacing = height / CGFloat(noHLines)
        let hSpacing = width / CGFloat(noVLines)
        
        let bPath = NSBezierPath()
        bPath.lineWidth = 5.0
        
        //converting coordinates to screen coordinate system where bottom left is 0,0
        let xCallibrate = xCoordinate + 10
        let yCallibrate = yCoordinate + 10
        
        //putting point to centre of coordinate
        var xVal = CGFloat(xCallibrate) * hSpacing + 4.5
        if(xCallibrate < 5) {
            xVal = CGFloat(xCallibrate) * hSpacing + 10
        }
        
        var yVal = CGFloat(yCallibrate) * vSpacing
        if(yCallibrate < 5) {
            yVal = CGFloat(yCallibrate) * vSpacing + 5
        }
        
        bPath.move(to: NSMakePoint(xVal, yVal))
        bPath.line(to: NSMakePoint(xVal, yVal + 6))
        
        bPath.stroke()
        
        
    }
    
}
