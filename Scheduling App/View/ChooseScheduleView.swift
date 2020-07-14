//
//  ChooseScheduleView.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/11/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct ChooseScheduleView: View {
    
    @EnvironmentObject var appData: AppData
    
    private func isValid(amount: String) -> Bool {
        if let amountAsString = Int(amount) {
            if amountAsString > 0 && amountAsString < 51 {
                return true
            } else {  return false }
        } else { return false }
    }
    
    var body: some View {
        VStack {
            Text("You can edit the amount of games on saturday and sunday.")
                .modifier(BodyText())
            
            ErrorTextField(title: "Saturday", placeHolder: "Maxmium of 10", helperText: "games on Saturday", text: $appData.totalGamesOnSat, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
            
            ErrorTextField(title: "Sunday", placeHolder: "Maxmium of 10", helperText: "games on Sunday", text: $appData.totalGamesOnSun, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
                .padding(.top, -200)
            
            NavigationLink(destination: PoolListView()) {
                Text("Continue")
                    .modifier(ButtonText())
                    .padding()
                
            }
            
        }.navigationBarTitle("Choose schedule")
        
        
    }
    
    
}

struct ChooseScheduleView_Preview: PreviewProvider {
    
    static var previews: some View {
        ChooseScheduleView()
    }
    
}
