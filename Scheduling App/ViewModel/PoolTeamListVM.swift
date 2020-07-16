//
//  PoolTeamListView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation

class PoolTeamListVM: ObservableObject {
    
    var totalPoolsAmount: String?
    var totalTeamsAmount: String?
    
}

struct PoolTeamListItem: Identifiable {
    let id: UUID = UUID()
    let name:String
    var teams: [PoolTeamListItem]? = nil
}
