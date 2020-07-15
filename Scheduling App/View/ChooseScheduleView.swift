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
            if amountAsString > 0 && amountAsString < 11 {
                return true
            } else {  return false }
        } else { return false }
    }
    
    var body: some View {
        VStack {
            Text("You can edit the amount of games on saturday and sunday.")
                .modifier(BodyText())
                .padding(5)
            
            ErrorTextField(title: "Saturday", placeHolder: "Maxmium of 10", helperText: "games on Saturday", text: $appData.totalGamesOnSat, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
            
            ErrorTextField(title: "Sunday", placeHolder: "Maxmium of 10", helperText: "games on Sunday", text: $appData.totalGamesOnSun, keyboardType: .numberPad, isValid: isValid(amount:))
                .padding()
                .padding(.top, -100)
            
            NavigationLink(destination: PoolListView().environmentObject(appData)) {
                Text("Continue")
                    .modifier(ButtonText())
                    .padding()
            }.disabled(!(isValid(amount: $appData.totalGamesOnSat.wrappedValue) && isValid(amount: $appData.totalGamesOnSun.wrappedValue)))
            
        }.navigationBarTitle("Choose schedule")
            
        .dismissKeyboardOnTap()
    }
}

class ChooseScheduleVM: ObservableObject {

    func updatePools() {
        
//        guard let numberOfPoolsAsInt = Int(appData.totalPools) else { return }
//        var finalArray = [[String]?]()
//
//        for index in 0...numberOfPoolsAsInt - 1 {
//            print("appended: \(index)")
//            finalArray.append(nil)
//        }
//
//        appData.pools = finalArray
    }
}

struct ChooseScheduleView_Preview: PreviewProvider {
    
    static var previews: some View {
        ChooseScheduleView()
    }
    
}
