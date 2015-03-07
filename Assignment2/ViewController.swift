//
//  ViewController.swift
//  Assignment2
//
//  Created by Jack McCracken on 2015-02-26.
//  Copyright (c) 2015 Jack McCracken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberView: UITextField!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var binaryButton: UIButton!
    @IBOutlet weak var hexButton: UIButton!

    let converter : BaseConverter = BaseConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Makes an error appear on the screen.
    func makeError() {
        numberView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        numberView.text = "error"
    }

    func clearError() {
        numberView.backgroundColor = nil
    }

    func makeGreen(button: UIButton) {
        // Reset all
        decimalButton.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        binaryButton.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        hexButton.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        button.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }

    //TODO Put the three in the same method
    @IBAction func decimalClicked(sender: UIButton) {
        if let results = getBaseAndNum(numberView.text) {
            if let decimal : Int = converter.toDecimal(results.baseId, numberStr: results.num) {
                clearError()
                makeGreen(sender)
                numberView.text = "d:" + String(decimal)
                return
            }
        }
        // Only reached iff error
        makeError()
    }

    func getBaseAndNum(text: String) -> (baseId : Character, num: String)? {
        let numSplit = split(text) {$0 == ":"}
        
        if numSplit.count == 2 && countElements(numSplit[0]) == 1 {
            return (Array(numSplit[0])[0], numSplit[1])
        }
        else {
            return nil
        }
    }

    @IBAction func binaryClicked(sender: UIButton) {
        if let results = getBaseAndNum(numberView.text) {
            if let decimal : Int = converter.toDecimal(results.baseId, numberStr: results.num) {
                if let binary : String = converter.fromDecimal("b", num: decimal) {
                    clearError()
                    makeGreen(sender)
                    numberView.text = "b:" + String(binary)
                    return
                }
            }
        }
        // Only reached iff error
        makeError()
    }

    @IBAction func hexClicked(sender: UIButton) {
        if let results = getBaseAndNum(numberView.text) {
            if let decimal : Int = converter.toDecimal(results.baseId, numberStr: results.num) {
                if let hex : String = converter.fromDecimal("h", num: decimal) {
                    clearError()
                    makeGreen(sender)
                    numberView.text = "h:" + String(hex)
                    return
                }
            }
        }
        // Only reached iff error
        makeError()
    }
}

