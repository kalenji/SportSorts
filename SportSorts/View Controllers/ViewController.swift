//
//  ViewController.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 27.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton:
        UIButton!
    
    
    @IBOutlet weak var logInButton:
        UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(logInButton)
    }


}

