//
//  MakeTeamView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct PoolListView: View {
    
    @EnvironmentObject var appData: AppData
//    @ObservedObject private var poolTeamListVM: PoolTeamListViewModel
    @State var showingAddTeamView = false
    @State var numberOfTeamSpots = 0
    @State var pools = [Int]()
    @State var isExpanded = [Bool]()
    
    var teams = ["gold", "blue", "red"]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(pools.indices) { index in
                    Section(header: Text("Pool \(index + 1)")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .padding()) {
                        if self.isExpanded[index] {
                            ForEach(self.teams.indices) { index in
                                Text("\(self.teams[index])")
                            }
                        } else {
                            EmptyView()
                        }
                    }.onTapGesture {
                        withAnimation{
                            self.isExpanded[index].toggle()
                            print("this is exapnded: \(self.isExpanded[index])")
                        }
                    }
                }
            }
            
            NavigationLink(destination: ScheduleView()) {
                Text("Schedule")
                    .modifier(ButtonText())
                    .padding()
            }
        }.navigationBarTitle("Pools & Teams")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddTeamView.toggle()
                }) {
                    Text("Add Team")
                }.sheet(isPresented: $showingAddTeamView) {
                    AddTeamView().environmentObject(self.appData)
                    }
                .onAppear(perform: {
                    guard let totalPools = Int(self.$appData.totalPools.wrappedValue) else { return }
                    
                    self.pools = Array(repeating: 0, count: totalPools)
                    self.isExpanded = Array(repeating: true, count: totalPools)
                })
        )
    }
}

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        PoolListView()
    }
}
