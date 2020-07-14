//
//  MakeTeamView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct TeamListView: View {
    
    let pools: [PoolViewModel]
    
    
    var body: some View {
        EmptyView()
    }
}

struct PoolListView: View {

    @State var numberOfTeamSpots = 0
    @State var poolsAvailable = [String]()
    @State var isExpanded = [false, false ,false, false, false]
    
    var section = ["pool a", "pool b", "pool c", "pool d"]
    var teams = ["gold", "blue", "red"]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(section.indices) { index in
                    Section(header: Text("\(self.section[index])")) {
                        if self.isExpanded[index] {
                            ForEach(self.teams.indices) { index in
                                Text("\(self.teams[index])")
                            }
                        } else {
                            EmptyView()
                        }
                    }.onTapGesture {
                        withAnimation{
                            print("this is the expanded index: \(index)")
                            self.isExpanded[index].toggle()
                            print("this is exapnded: \(self.isExpanded[index])")
                        }
                    }
                }
            }
        }.navigationBarTitle("Make Team")
    }
}

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        PoolListView()
    }
}
