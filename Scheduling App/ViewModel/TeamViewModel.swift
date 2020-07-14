//
//  TeamListViewModel.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation

class TeamViewModel: Identifiable {
    
    let id = UUID()
    var team: Team
    
    init(team: Team) {
        self.team = team
    }
    
    var teamName: String {
        return team.name
    }
}


