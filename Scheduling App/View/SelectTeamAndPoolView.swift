//
//  SelectTeamAndPoolView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct SelectTeamAndPoolView: View {
    
    @State private var teamSizeAmount = ""
    @State private var poolSizeAmount = ""
    
    private func isValid(amount: String) -> Bool {
        let amountAsString = Int(amount)
        
        if amountAsString! > 0 && amountAsString! < 51 {
            return true
        } else { return false }
    }
    
    var body: some View {
        VStack {
            Text("You can edit the team and pool size to fit your needs.")
                .modifier(BodyText())
            
            ErrorTextField(title: "Team Size", placeHolder: "Maxmium of 50", helperText: "teams", text: $teamSizeAmount, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
            
            ErrorTextField(title: "Pool Size", placeHolder: "Maxmium of 50", helperText: "pools", text: $poolSizeAmount, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
                .padding(.top, -200)
            }.navigationBarTitle("Choose size")
        
    }
}

struct SelectTeamAndPoolView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTeamAndPoolView()
    }
}
