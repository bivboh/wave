//
//  ViewController.swift
//  wave
//
//  Created by athenian on 5/19/23.
//


import UIKit



var team1Names: [String] = []
var team1Location: [Double] = []
func addToTeam1Location(_ value: Double?) {
    if let unwrappedValue = value {
        team1Location.append(unwrappedValue)
    }
}
func addToteam1Names(_ value: String?) {
    if let unwrappedValue = value {
        team1Names.append(unwrappedValue)
    }
}

var team1 = Team(members: team1Names, location: team1Location)



class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var name3: UITextField!
    
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var long: UITextField!
    
    @IBAction func submitTapped(_ sender: Any) {
        addToteam1Names(name3.text)
        addToteam1Names(name2.text)
        addToteam1Names(name1.text)
        addToTeam1Location(Double(long.text ?? "0"))
        addToTeam1Location(Double(lat.text ?? "0"))
    }
}


