//
//  SelectTeamAndPoolVM.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/15/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import Foundation
import SwiftUI

class SelectTeamAndPoolVM: ObservableObject {
    
    var totalTeamAmount: String?
    var totalPoolAmount: String?
    var pool = [[TeamVM?]]()
    
    func setupPools() {
        if let totalPoolAsInt = Int(totalPoolAmount ?? "0") {
            pool = Array(repeating: [nil], count: totalPoolAsInt)
        }
        
        print("this is the pool object: \(pool)")
    }
    
}
