//
//  LoginViewController.swift
//  CustomLoginDemo
//
//  Created by Carter Sessions on 6/10/20.
//  Copyright © 2020 Carter Sessions. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwardTextField: UITextField!
    
   
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        ErrorLabel.alpha = 0
        
       
    }
    
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwardTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else {
                
//                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
                self.performSegue(withIdentifier: "goToWelcome", sender: self)
            }
        }
    }
    
}
