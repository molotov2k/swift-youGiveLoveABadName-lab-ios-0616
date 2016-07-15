//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJovi: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    var fullSize = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
        
        self.buttonOutlet.enabled = false
        
        if fullSize {
            
            UIView.animateKeyframesWithDuration(1.0, delay: 0, options: .CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(1.1)
                })
                UIView.addKeyframeWithRelativeStartTime(0.33, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(0.4)
                })
                UIView.addKeyframeWithRelativeStartTime(0.66, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(0.5)
                })
                }, completion: { (true) in
                    self.fullSize = false
                    self.buttonOutlet.enabled = true
            })
            
        } else {
            
            UIView.animateKeyframesWithDuration(1.0, delay: 0, options: .CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(0.4)
                })
                UIView.addKeyframeWithRelativeStartTime(0.33, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(1.1)
                })
                UIView.addKeyframeWithRelativeStartTime(0.66, relativeDuration: 0.33, animations: {
                    self.bonJoviResizeHeight(1.0)
                })
                }, completion: { (true) in
                    self.fullSize = true
                    self.buttonOutlet.enabled = true
            })
        }
    }
    
    func bonJoviResizeHeight(newSize: CGFloat) {
        let superViewHeight = self.view.bounds.height
        let newBonJoviSize = superViewHeight * newSize
        let newTopBorder = (superViewHeight - newBonJoviSize) / 2
        self.bonJovi.frame = CGRectMake(0, newTopBorder, self.view.bounds.width, newBonJoviSize)
        self.view.layoutIfNeeded()
        
    }
    

}

