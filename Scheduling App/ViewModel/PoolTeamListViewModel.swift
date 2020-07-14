//
//  PoolTeamListView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation

class PoolTeamListViewModel: ObservableObject {
    
    var totalPoolsAmount: String
    var totalTeamsAmount: String
    var pools = [[TeamViewModel]?]()
    
    init(totalTeamsAmount: String, totalPoolsAmount: String) {
        self.totalTeamsAmount = totalTeamsAmount
        self.totalPoolsAmount = totalPoolsAmount
    }
    
    func setupPools(numberOfPools: String) {
        if let numberOfPoolsAsInt = Int(numberOfPools) {
            for index in 0...numberOfPoolsAsInt {
                pools[index] = nil
            }
        }
    }
}
