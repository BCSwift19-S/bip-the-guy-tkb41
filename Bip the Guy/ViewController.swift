//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Kyle Burns on 2/3/19.
//  Copyright © 2019 t. kyle burns. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    
    
    
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
        let shrinkValue = 60
        
        
        
        
        //shrink image to pinch 60 pix
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + 60
            , y: self.imageToPunch.bounds.origin.y + 60 , width: self.imageToPunch.bounds.size.width - 60, height: self.imageToPunch.bounds.size.height - 60)
        
        UIView.animate(withDuration: 0.25 , delay: 0.0, usingSpringWithDamping: 2.0 , initialSpringVelocity: 10.0 ,  options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
        
    }
        
        func playSound(soundName: String, audioPlayer: inout AVAudioPlayer ) {
            //can we load in a file with soundName
            if let sound = NSDataAsset(name: soundName) {
                // check if sound.data is a sound file
                do {
                    try audioPlayer = AVAudioPlayer(data: sound.data)
                    audioPlayer.play()
                    
                } catch {
                    // if sound.data is nota valid audio file
                    print("ERROR: \(soundName) could not be played as a sound." )
                }
            } else {
                // if reading the NSdataAssset doesnt work tell the developer
                print("ERROR: file \(soundName) didnt load")
            }
        }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
   
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "ok", style: .default, handler:nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    // MARK: actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion:  nil)
        
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        imagePicker.sourceType = .camera
        
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion:  nil)
        } else {
            showAlert(title: "Camera not Available", message: "where yo camera @")
        }
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateimage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
        
    }
    

    
    


}
