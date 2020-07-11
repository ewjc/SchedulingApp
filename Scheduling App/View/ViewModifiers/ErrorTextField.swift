//
//  ErrorTextField.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct ErrorTextField: View {
    let title: String
    let placeHolder: String
    let helperText: String
    let text: Binding<String>
    let keyboardType: UIKeyboardType
    let isValid: (String) -> Bool
    
    var showsError: Bool {
        if text.wrappedValue.isEmpty {
            return false
        } else {
            return !isValid(text.wrappedValue)
        }
    }
    
    init(title: String, placeHolder: String, helperText: String, text: Binding<String>, keyboardType: UIKeyboardType = UIKeyboardType.default, isValid: @escaping (String) -> Bool = {_ in true}) {
        self.title = title
        self.placeHolder = placeHolder
        self.helperText = helperText
        self.text = text
        self.keyboardType = keyboardType
        self.isValid = isValid
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(self.title)
                    .foregroundColor(Color(.lightGray))
                    .fontWeight(.bold)
                
                HStack {
                    TextField(self.placeHolder, text: self.text)
                        .keyboardType(self.keyboardType)
                    Text(self.helperText)
                        .foregroundColor(Color(.darkGray))
                        .padding(.horizontal, 10)
                }
                
                Rectangle()
                    .foregroundColor(self.showsError ? .red : .gray)
                    .frame(width: geometry.size.width - 10, height: 2, alignment: .center)
                    .padding(.top, -10)
            }
        }
       
        
    }
}

struct ErrorTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorTextField(title: "Team Size", placeHolder: "Maximum 20", helperText: "teams", text: .constant("50"), keyboardType: .numberPad, isValid: {_ in true})
                .padding()
                .previewLayout(.fixed(width: 400, height: 50))
        }
    }
}
