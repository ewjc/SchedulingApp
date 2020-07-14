//
//  ViewModifiers.swift
//  Scheduling App
//
//  Created by Eric Wong on 7/10/20.
//  Copyright © 2020 Eric Wong. All rights reserved.
//

import SwiftUI

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.largeTitle.weight(.bold))
    }
}

struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 18, weight: .medium, design: .default))
    }
}

struct ButtonText: ViewModifier {
    func body(content: Content) -> some View {
        
        content
            .font(Font.system(size: 20, weight: .bold, design: .default))
            .padding(.horizontal, 100)
            .padding()
            .accentColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            .shadow(color: .gray, radius: 15, x: 0, y: 5)
    }
}

struct SimpleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 18, weight: .regular, design: .default))
            .accentColor(.blue)
    }
}


// Dismiss Keyboard w/ View extension

public extension View {
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTap())
    }
}

public struct DismissKeyboardOnTap: ViewModifier {
    public func body(content: Content) -> some View {
        #if os(macOS)
        return content
        #else
        return content.gesture(tapGesture)
        #endif
    }

    private var tapGesture: some Gesture {
        TapGesture().onEnded(endEditing)
    }

    private func endEditing() {
        UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive}
            .map {$0 as? UIWindowScene}
            .compactMap({$0})
            .first?.windows
            .filter {$0.isKeyWindow}
            .first?.endEditing(true)
    }
}
