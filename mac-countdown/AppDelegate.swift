//
//  AppDelegate.swift
//  mac-countdown
//
//  Created by Hamish Dickson on 26/12/2014.
//  Copyright (c) 2014 HamishDickson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theButton: NSButton!
    @IBOutlet weak var theLabel: NSTextField!
    
    var timeRemaining = 0;
    
    var TWENTY_FIVE = 25;
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    
    override func awakeFromNib() {
        theLabel.stringValue = "Countdown \n \(timeRemaining) seconds"
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "Countdown"
        
        //Add menuItem to menu
        menuItem.title = "25 min countdown"
        menuItem.action = Selector("setWindowVisible:")
        menuItem.keyEquivalent = ""
        menu.addItem(menuItem)
        
        timeRemaining = TWENTY_FIVE

    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        self.window!.orderOut(self)
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        timeRemaining -= 1
        theLabel.stringValue = "Countdown \n \(timeRemaining) seconds"
        statusBarItem.title = "\(timeRemaining)"
    }
    
    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }
    
}

