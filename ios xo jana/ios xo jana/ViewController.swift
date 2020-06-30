//
//  ViewController.swift
//  ios xo jana
//
//  Created by janoya elba6a on 6/30/20.
//  Copyright © 2020 janaaldhefiri124. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


      @IBOutlet weak var turnLabel: UILabel!
      @IBOutlet weak var b1: UIButton!
      @IBOutlet weak var b2: UIButton!
      @IBOutlet weak var b3: UIButton!
      @IBOutlet weak var b4: UIButton!
      @IBOutlet weak var b5: UIButton!
      @IBOutlet weak var b6: UIButton!
      @IBOutlet weak var b7: UIButton!
      @IBOutlet weak var b8: UIButton!
      @IBOutlet weak var b9: UIButton!
      
    var buttons: [UIButton] = []
    
      var counter = 0
    
    var backgroundSound:AVAudioPlayer?
    var chickenSound:AVAudioPlayer?
    
    func playMusic(){
        let path = Bundle.main.path(forResource: "pink panther.mp3", ofType: nil)!
      let url = URL(fileURLWithPath: path)

      do {
          backgroundSound = try AVAudioPlayer(contentsOf: url)
          backgroundSound?.play()
      } catch {
          // couldn't load file :(
      }
    }
    
    
    override func viewDidLoad() {
      buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        playMusic()
    }
      
      @IBAction func press(_ sender: UIButton) {
          if counter % 2 == 0{
                     
                     sender.setTitle("x", for: .normal)
                     sender.setTitleColor(.green, for: .normal)
                     turnLabel.text = "o turn"
                     
                 }
                 else {
                     sender.setTitle("o", for: .normal)
                     sender.setTitleColor(.red, for: .normal)
                     turnLabel.text = "x turn"
                 }
                 counter += 1
                 sender.isEnabled = false
          
          winning(winner: "x")
          winning(winner: "o")
        
        if counter == 9{
            restartGame()
        }
      }
      
      @IBAction func reset() {
          restartGame()
      }
      
      
    
        func winning(winner : String){
              if (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
                 (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
                 (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
                 (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
                 (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
                 (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
                 (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
                  (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
              {
                  print("\(winner) الفائز")
                  let alertController = UIAlertController(title: "\(winner) فاز", message: "قم بالضغط على الزر كي يقوم بإعادة اللعب", preferredStyle: .alert)
                  let restartAction = UIAlertAction(title: "إعادة اللعب", style: .cancel) { (alert) in
                      self.restartGame()}
                  alertController.addAction(restartAction)
                  present(alertController, animated: true, completion: nil)
             
          
              }
            
             
      }
      
      func restartGame(){
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
            
        }
       
          counter = 0
          turnLabel.text = "x turn"
          
      }
      
      }





