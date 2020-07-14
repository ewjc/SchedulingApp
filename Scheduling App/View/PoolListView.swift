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
    
    @EnvironmentObject var appData: AppData

    @State var numberOfTeamSpots = 0
    @State var poolsAvailable = [String]()
    @State var isExpanded = [false, false ,false, false, false]
    
    var section = ["pool a", "pool b", "pool c", "pool d"]
    var teams = ["gold", "blue", "red"]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(appData.pools.indices) { index in
                    Section(header: Text("Pool: \(index)")) {
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
            .onAppear {
                print("this is the total pools: \(self.$appData.totalPools.wrappedValue)")
        }
    }
}

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        PoolListView()
    }
}
