//
//  ViewController.swift
//  SeguesAndGestures
//
//  Created by Pauline Broängen on 2022-09-01.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textAge: UITextField!
    @IBOutlet var textMail: UITextField!
    
    @IBOutlet var imgBall: UIImageView!
    @IBOutlet var imgBox: UIImageView!
    
    
    @IBOutlet var horizontalBallConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var verticalBallConstraint: NSLayoutConstraint!
    
    
    var segueResultPage = "segueResultPage"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        if let simpleBall = sender.view {
            
            //nedanför är ena sättet att fixera bollen på
            // simpleBall.center = CGPoint(x: simpleBall.center.x + translation.x, y: simpleBall.center.y + translation.y)
            
            //nedanför är andra sättet att fixera bollen på
            horizontalBallConstraint.constant = horizontalBallConstraint.constant + translation.x
            
            verticalBallConstraint.constant = verticalBallConstraint.constant + translation.y
            
            
            if imgBox.frame.contains(simpleBall.frame) {
                print("Bingo")
                
                horizontalBallConstraint.constant = 0
                
                verticalBallConstraint.constant = 30
                
                sender.state = .ended
                self.view.layoutIfNeeded()
                
                performSegue(withIdentifier: "segueResultPage", sender: self)
            }
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    //prepare kommer att köras på grund av override funktionen som ser till att alla segues som kommer att köras görs likadant. efter den har startats men innan den har blivit klar.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueResultPage {
            
            let destinationVC = segue.destination as! ScreenTwoViewController
            
            //nedanför dubbelkollar vi nullvärden. att allt som ska fyllas i är ifyllt....
            if let name = textName.text,
               let age = Int(textAge.text ?? ""),
               let mail = textMail.text {
                //if name inte är lika med något tomt samt att age är större än eller likamed 18 samt mail inte är likamed tomt då kör vi den här funktionen. om det här är sant så ska vi lyckas på nästa sida och om det inte är det så ska vi misslyckas på nästa sida. dvs passed eller failed. allt måste vara rätt ifyllt.
                if name != "" && age >= 18 && mail != "" {
                    destinationVC.passed = true
                } else {
                    destinationVC.passed = false
                    
                }
                
                return
                
            }
            //om någon är null, nil så ska det bli false.......
            destinationVC.passed = false
        }
        
    }
}






