//
//  matchmaker.swift
//  wave
//
//  Created by athenian on 5/25/23.
//

import Foundation
import CoreLocation

class Matchmaker {
    private var teams: [Team]

    init(teams: [Team]) {
        self.teams = teams
    }

    func createMatches() -> [Team: Team] {
        var matches: [Team: Team] = [:]

        while !teams.isEmpty {
            let team_1 = teams[0]
            guard let team_2 = getNearestTeam(to: team_1) else {
                break
            }

            matches[team_1] = team_2
            matches[team_2] = team_1

            if let index = teams.firstIndex(where: { $0 == team_1 }) {
                teams.remove(at: index)
            }

            if let index = teams.firstIndex(where: { $0 == team_2 }) {
                teams.remove(at: index)
            }
        }

        return matches
    }

    private func getNearestTeam(to team: Team) -> Team? {
        var shortestDistance = Double.greatestFiniteMagnitude
        var nearestTeam: Team?

        for otherTeam in teams {
            if otherTeam == team {
                continue
            }

            let distance = calculateDistance(team_1: team, team_2: otherTeam)

            if distance < shortestDistance {
                shortestDistance = distance
                nearestTeam = otherTeam
            }
        }

        return nearestTeam
    }

    
    private func calculateDistance(team_1: Team, team_2: Team) -> Double {
        let latitude1 = team_1.location[0]
        let longitude1 = team_1.location[1]
        let latitude2 = team_2.location[0]
        let longitude2 = team_2.location[1]

        let location1 = CLLocation(latitude: latitude1, longitude: longitude1)
        let location2 = CLLocation(latitude: latitude2, longitude: longitude2)

        return location1.distance(from: location2)
    }
}
