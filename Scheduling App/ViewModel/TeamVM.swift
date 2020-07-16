//
//  TeamListViewModel.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation


struct TeamVM: Identifiable {
    
    let id = UUID()
    var teamName: String
    var teams: [TeamVM]? = nil
    
}



