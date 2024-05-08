//
//  HomeViewController.swift
//  Demo
//
//  Created by user259867 on 5/7/24.
//

import UIKit
import Foundation
class HomeViewController: UIViewController {

    @IBOutlet weak var intrests: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userLocationLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    let sharedLocationManager = LocationManager.shared
    let randomPeople = RandomPeopleManager()
    var data  = [RandomPeopleProfiles]()
    var position = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = randomPeople.getPeopleData()
        updatePerson()
        if let currentLocation = sharedLocationManager.currentLocation {
            // Use currentLocation.latitude and currentLocation.longitude
            userLocationLabel.text = "Lat: \(currentLocation.coordinate.latitude), Longi: \(currentLocation.coordinate.longitude)"
            
            //print("Latitude: \(currentLocation.coordinate.latitude), Longitude: \(currentLocation.coordinate.longitude)")
        } else {
            print("Location not available yet.")
        }

    }
    
    func updatePerson(){
        image.image = UIImage(named: data[position].Photo)
        name.text = "Name : \(data[position].Name)"
        age.text = "Age : \(data[position].Age)"
        city.text = "City : \(data[position].Location)"
        intrests.text = "Intrests : \(data[position].Intrests)"
    }
    
    
    
    
    @IBAction func chatNowPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChat", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ChatViewController
        vc.name = name.text!
        vc.photoname = data[position].Photo
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        position = (position+1)%data.count
        updatePerson()
    }
    
    
    @IBAction func prevPressed(_ sender: UIButton) {
        position = (position - 1 + data.count) % data.count
        updatePerson()
    }
 

}
