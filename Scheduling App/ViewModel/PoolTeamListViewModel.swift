//
//  PoolTeamListView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation

class PoolTeamListViewModel {
    
    var totalPoolsAmount: Int
    var totalTeamsAmount: Int
    var pools = [Int : [TeamViewModel]?]()
    
    init(totalTeamsAmount: Int, totalPoolsAmount: Int) {
        self.totalTeamsAmount = totalTeamsAmount
        self.totalPoolsAmount = totalPoolsAmount
        
        setupPools(numberOfPools: totalPoolsAmount)
    }
    
    func setupPools(numberOfPools: Int) {
        for index in 1...numberOfPools {
            pools[index] = nil
        }
    }
}

class PoolViewModel: Identifiable {
    
    let id = UUID()
    var pool: Pool
    
    init(pool: Pool) {
        self.pool = pool
    }
    
    var poolNumber: Int {
        return pool.poolNumber
    }
}
