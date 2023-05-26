//
//  ViewController7.swift
//  wave
//
//  Created by athenian on 5/25/23.
//

import UIKit

class ViewController7: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var matchmakeButton: UIButton!
    @IBOutlet weak var match1: UILabel!
    @IBOutlet weak var match2: UILabel!
    @IBOutlet weak var match3: UILabel!
    func performMatchmaking(){
        
        let teams = [team1, team2, team3, team4, team5, team6]
        let matchmaker = Matchmaker(teams: teams)
        let matches = matchmaker.createMatches()

        var index = 0
        for (teamx, teamy) in matches {
            let matchText = "\(teamx.members) -> \(teamy.members)"
            
            switch index {
            case 0:
                match1.text = matchText
            case 1:
                match2.text = matchText
            case 2:
                match3.text = matchText
            default:
                break
            }
            
            index += 1
        }

        }
    
    @IBAction func ButtPress(_ sender: Any) {
        performMatchmaking()
    }
    
    }

