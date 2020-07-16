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
    @ObservedObject private var poolTeamListVM = PoolTeamListVM()
    
    @State var showingAddTeamView = false
    @State var numberOfTeamSpots = 0
    @State var isExpanded = [Bool]()
    
    var body: some View {
        VStack {
            List {
                ForEach($appData.pools.wrappedValue.indices) { index in
                    Section(header: Text("Pool \(index + 1)")
                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                .padding(.leading, -5)
                                .padding()) {

                    }
                }
            }
        }
        
        NavigationLink(destination: ScheduleView()) {
            Text("Schedule")
                .modifier(ButtonText())
                .padding()
        }.navigationBarTitle("Pools & Teams")
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddTeamView.toggle()
                                }) {
                                    Text("Add Team")
                                }.sheet(isPresented: $showingAddTeamView) {
                                    AddTeamView().environmentObject(self.appData)
                                }
        )
    }
}

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        PoolListView()
    }
}
