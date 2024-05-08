//
//  RandomPeopleManager.swift
//  Demo
//
//  Created by user259867 on 5/7/24.
//

import Foundation

struct RandomPeopleManager{
    var data = [
     RandomPeopleProfiles(Name: "Charan", Age: 21, Location: "Hyderabad", Intrests: "Cricket, Movies, Food", Photo: "Charan"),
     RandomPeopleProfiles(Name: "Lokesh", Age: 22, Location: "Mumbai", Intrests: "Cricket, Movies, Food", Photo: "Dummy1"),
     RandomPeopleProfiles(Name: "Sandeep", Age: 23, Location: "Warangal", Intrests: "Cricket, Movies, Food", Photo: "Dummy2"),
     RandomPeopleProfiles(Name: "Abhilash", Age: 20, Location: "Pune", Intrests: "Cricket, Movies, Food", Photo: "Dummy1"),
     RandomPeopleProfiles(Name: "Varan", Age: 30, Location: "Goa", Intrests: "Cricket, Movies, Food", Photo: "Dummy2"),
     RandomPeopleProfiles(Name: "Aman", Age: 26, Location: "Hyderabad", Intrests: "Cricket, Movies, Food", Photo: "Dummy1")
     ]
    func getPeopleData()->[RandomPeopleProfiles]{
        return data
    }
    
}
