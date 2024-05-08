//
//  SignInViewController.swift
//  Demo
//
//  Created by user259867 on 5/7/24.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSelctor: UIPickerView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var gender = ""
    var genders = ["Male","Female","Others"]
    let userData = UsersData()
    override func viewDidLoad() {
        super.viewDidLoad()
        genderSelctor.delegate = self
        genderSelctor.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gender = genders[row]
        return genders[row]
    }

    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text , let password = passwordTextField.text{
            let name = nameTextField.text
            let age = ageTextField.text
            let user = UsersProfile(name: name!, email: email, password: password, gender: gender, age: age!)
            userData.createUser(user: user)
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
}
