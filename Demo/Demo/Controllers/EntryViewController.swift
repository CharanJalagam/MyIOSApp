//
//  ViewController.swift
//  Demo
//
//  Created by user259867 on 5/7/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class EntryViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                self!.performSegue(withIdentifier: "logedIn", sender: self)
            }
        }
        else{
            
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
    }
}

