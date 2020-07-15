//
//  AddTeamView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/14/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct AddTeamView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State private var isExpanded = false
    @State private var selectedNum = 1
    @State private var teamName = ""
    
    private func isValid(teamName: String) -> Bool {
        if teamName.count < 0 && teamName.count > 20 {
            return false
        } else { return true }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Make a team")
                .font(.largeTitle)
                .fontWeight(Font.Weight.heavy)
                .padding(.top, 10)
            
            Text("You can create a team by choosing a team name and selecting a pool.")
                .modifier(BodyText())
                .padding(5)
                        
            Text("Choose a pool")
            DisclosureGroup("Pool \(selectedNum)", isExpanded: $isExpanded) {
                VStack {
                    ForEach(1...Int($appData.totalPools.wrappedValue)!, id: \.self) { num in
                        Text("Pool \(num)")
                            .padding(3)
                            .onTapGesture {
                                self.selectedNum = num
                                withAnimation {
                                    self.isExpanded.toggle()
                                }
                            }
                    }
                }
            }.accentColor(.white)
            .font(.title2)
            .foregroundColor(.white)
            .padding(.all)
            .background(Color.blue)
            .cornerRadius(8)
            
            
            ErrorTextField(title: "Team", placeHolder: "Enter a team name", helperText: "", text: $teamName, keyboardType: .asciiCapable, isValid: isValid(teamName:))
                .padding()
            


            
            Spacer()
            Spacer()
            Spacer()
            
        }.padding(.all)
        
        NavigationLink(destination: ChooseScheduleView().environmentObject(appData)) {
            Text("Continue")
            .modifier(ButtonText())
            .padding()
        }.disabled(isValid(teamName: $teamName.wrappedValue))
        
    }
}


struct AddTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamView()
    }
}
