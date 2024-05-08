//
//  ProfileViewController.swift
//  Demo
//
//  Created by user259867 on 5/7/24.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var MaleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    
    var email : String = ""
    var userData = UsersData()
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if let user = user {
            email = user.email!
            let user = userData.getUserByEmail(email:email)
            namelabel.text = user?.name
            ageLabel.text = user?.age
            MaleLabel.text = user?.gender
            emailLabel.text = user?.email
        }
       
    }
    @IBAction func signOutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            let alertController = UIAlertController(title: "Signed Out Succesfull", message: "", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                   alertController.addAction(okAction)
                   present(alertController, animated: true, completion: nil)
            

        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}
