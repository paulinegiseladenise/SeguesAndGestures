//
//  ScreenTwoViewController.swift
//  SeguesAndGestures
//
//  Created by Pauline Broängen on 2022-09-01.
//

import UIKit

class ScreenTwoViewController: UIViewController {
    
    
    
    @IBOutlet weak var imgResult: UIImageView!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    //genom den här variabeln med bool kan vi veta om vi har passed eller failed.
    var passed: Bool?
    
    
    //skapade en variabel för resultatknappen till andra viewcontrollern = passed = ScreenTwo
    //nedanför är mitt första försök med uppgiften...
    //    var fromBtnToSecondView: String = "fromBtnToSecondView"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Det andra sättet att göra nedanstående på är med switch och då
        //switch passed {
        //case true:
        // imgResult.image = UIImage(named: "success")
        //lblResult.text = "You have passed the test!"
        //break
        //case false:
        //imgResult.image = UIImage(named: "failed")
        //lblResult.text = "You have failed the test!"
        //break
        //case default:
        //break
        // }
        
        
        if let passed = passed {
            if passed == true {
                imgResult.image = UIImage(named: "passed")
                lblResult.text = "You have passed the test"
            } else {
                imgResult.image = UIImage(named: "failed")
                lblResult.text = "You have failed the test"
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    //nedanför är mitt första försök...
    //@IBAction func btnResult(_ sender: Any) {
     //   performSegue(withIdentifier: fromBtnToSecondView, sender: self)
    //}
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
