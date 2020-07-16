//
//  Global.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Combine

final class AppData: ObservableObject {
    
    @Published var totalTeams: String = ""
    @Published var totalPools: String = ""
    @Published var totalGamesOnSat: String = ""
    @Published var totalGamesOnSun: String = ""
    @Published var pools = [[TeamVM?]]()
    
}
