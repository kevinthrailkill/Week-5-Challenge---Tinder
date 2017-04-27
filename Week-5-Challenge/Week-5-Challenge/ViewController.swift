//
//  CardsViewController.swift
//  Week-5-Challenge
//
//  Created by Kevin Thrailkill on 4/26/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    var centerPoint : CGPoint?
    
    @IBOutlet weak var centerLayoutContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        
        profileImageView.addGestureRecognizer(panGestureRecognizer)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didPan(sender: UIPanGestureRecognizer) {
        print("Did Pan")
        
        
        switch sender.state {
        case .began:
            centerPoint = profileImageView.center
        case .changed:
            
            let translation = sender.translation(in: view)
            centerLayoutContraint.constant = translation.x
        case .ended:
            profileImageView.center = centerPoint!
        default:
            break
        }
        
        
        
    }


}

