//
//  SelectTeamAndPoolView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct SelectTeamAndPoolView: View {
    
    @EnvironmentObject var appData: AppData

//    @ObservedObject private var selectTeamAndPoolVM = SelectTeamAndPoolVM()
    
    private func isValid(amount: String) -> Bool {
        if let amountAsString = Int(amount) {
            if amountAsString > 0 && amountAsString < 51 {
                return true
            } else {  return false }
        } else { return false }
    }
    
    var body: some View {
        VStack {
            Text("You can edit the team and pool size to fit your needs.")
                .modifier(BodyText())
            
            ErrorTextField(title: "Team Size", placeHolder: "Maxmium of 50", helperText: "teams", text: $appData.totalTeams, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
            
            ErrorTextField(title: "Pool Size", placeHolder: "Maxmium of 50", helperText: "pools", text: $appData.totalPools, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
                .padding(.top, -200)
            
            NavigationLink(destination: ChooseScheduleView().environmentObject(appData)) {
                Text("Continue")
                .modifier(ButtonText())
                .padding()
            }
            
            }.navigationBarTitle("Choose size")
        .dismissKeyboardOnTap()
    }
}

struct SelectTeamAndPoolView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTeamAndPoolView()
    }
}
