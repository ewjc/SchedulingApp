//
//  Schedule.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation

class Schedule {
    
    var totalGamesSat: Int
    var totalGamesSun: Int
    
    init(totalGamesSat: Int, totalGamesSun: Int) {
        self.totalGamesSat = totalGamesSat
        self.totalGamesSun = totalGamesSun
    }
}
