//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Carter Sessions on 6/10/20.
//  Copyright © 2020 Carter Sessions. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    var nameText = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
//
//        // Hide the error label
        ErrorLabel.alpha = 0


    }

    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {

        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {

            return "Please fill in all fields."
        }

        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            // Password isn't secure enough
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }

        return nil
    }


    @IBAction func signUpTapped(_ sender: Any) {
        
//        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//            if error != nil {
//                print(error!)
//            }
//            else {
//                //success
//                print("Registration Successful")
////                let userID = Auth.auth().currentUser?.uid
////                var ref : DatabaseReference!
////                ref = Database.database().reference().child("users").child(userID!).child("personalInfo")
////                let infoDict : [String : Any] = ["name" : self.fullNameTextField.text!, "Location" : "Empty", "School" : "Empty", "Hours" : "0"]
////                ref.setValue(infoDict)
//                self.performSegue(withIdentifier: "goToHome", sender: self)
//            }
//        }

        // Validate the fields
        let error = validateFields()

        if error != nil {

            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {

            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in

                // Check for errors
                if err != nil {

                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {

                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()

                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in

                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }

                    // Transition to the home screen
                    self.transitionToHome()
                }

            }



        }
    }

    func showError(_ message:String) {

        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }

    func transitionToHome() {
        self.nameText = emailTextField.text!
        performSegue(withIdentifier: "test", sender: self)
//        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      var vc = segue.destination as! AccountViewController
      vc.finalName = self.nameText
      //var vctwo = segue.destination as! ThirdViewController
      //vctwo.finalName = self.nameText
    }
    
}
