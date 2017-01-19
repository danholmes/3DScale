//
//  ViewController.swift
//  3DScale
//
//  Created by Dan on 2017-01-16.
//  Copyright © 2017 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    
    var currentForce: CGFloat! = 0
    
    var currentTouches: NSMutableArray! = NSMutableArray()
    
    
    func displayCurrentTouchInformation() {
        
        guard self.currentTouches.count != 0 else {
            currentForce = 0
            forceLabel.text = "No Touch Forces"
            return
        }
        
        forceLabel.text = "Touch Forces"
        var totalForce: CGFloat = 0
        
        for item in self.currentTouches {
            if let touch = item as? UITouch {
                forceLabel.text?.append("\n \(touch.force)")
                totalForce += touch.force
            }
        }
        forceLabel.text?.append("\n Total Force \n \(totalForce)")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if !self.currentTouches.contains(touch) {
                self.currentTouches.add(touch)
            }
        }
        self.displayCurrentTouchInformation()
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.displayCurrentTouchInformation()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if self.currentTouches.count != 0 &&
                self.currentTouches.contains(touch){
                self.currentTouches.remove(touch)
            }
        }
        self.displayCurrentTouchInformation()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isMultipleTouchEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
