//
//  ViewController.swift
//  macos2
//
//  Created by Maxim Meyer on 26.12.20.
//

import Cocoa
import AppKit

extension String
{
    func trim() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}

class ViewController: NSViewController {

    func isPrime(_ n: Int) -> Bool {
        guard n >= 2     else { return false }
        guard n != 2     else { return true  }
        guard n % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }
    
    func isInt(_ s: String)->Bool{
        guard (Int(s) != nil) else { return false }
        return true
    }

    @IBOutlet weak var prime_field: NSTextField!
    @IBOutlet weak var label_field: NSTextField!
    
    @IBAction func check_prime(_ sender: NSButton) {
        var name = prime_field.stringValue.trim()
        //var myInt: Int
        
        if isInt(name) {
            let myInt=Int(name)
            if isPrime(myInt!){
                    let greeting = String(myInt ?? 0)+" is a prime number!"
                    label_field.stringValue = greeting
                    NSSound.beep()
                }else
                {
                    let greeting = String(myInt ?? 0)+" is not a prime number :("
                    label_field.stringValue = greeting
                    NSSound.beep()
                }
        }else
        {
            label_field.stringValue = String(name) + " is not a number. Please enter a number!"
            NSSound.beep()
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "Prime checker"
    }
    
}

