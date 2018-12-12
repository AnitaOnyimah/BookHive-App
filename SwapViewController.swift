//
//  SwapViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/18/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit

class SwapViewController: UIViewController {
    
    var divisor: CGFloat!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61

        // Do any additional setup after loading the view.
    }
    
    @IBAction func panCard(_ sender:
        UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)

        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "thumbs up2")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumbs down2")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if card.center.x < 75 {
                //move to the left side
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                })
                return
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
            }
        
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
        })
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
