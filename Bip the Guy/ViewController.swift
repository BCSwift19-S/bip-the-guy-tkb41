//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Kyle Burns on 2/3/19.
//  Copyright © 2019 t. kyle burns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
        
    }
    
    //Mark: functions
    func animateimage () {
    let bounds = self.imageToPunch.bounds
        
        //shrink image to pinch 6- pix
        self.imageToPunch.bounds = CGRect (x: self.imageToPunch.origin.x + 60, y: self.imageToPunch.origin.y + 60, width: self.imageToPunch.size.width - 60, height: self.imageToPunch.size.height - 60)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringDampening: 0.2,
                       
            initialSpringVelocity, 10, option: [],
            animations: {  self.imageToPunch.bounds = bounds   } , completion: nil)?
    
    
    }
    // MARK: actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer){
        animateimage
    }
    
}

