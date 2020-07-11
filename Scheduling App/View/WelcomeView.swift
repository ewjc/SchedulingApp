//
//  ContentView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Team Scheduling")
                .modifier(TitleText())
            Text("Make teams, choose pool, and create a schedule.")
                .modifier(BodyText())
                .padding(.top, 15)
            Spacer()
            Spacer()
            NavigationLink(destination: SelectTeamAndPoolView()) {
                Text("Continue")
                .modifier(ButtonText())
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
