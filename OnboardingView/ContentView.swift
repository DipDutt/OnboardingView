//
//  ContentView.swift
//  OnboardingView
//
//  Created by Dip Dutt on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("sign_in") var singIn:Bool = false
    var body: some View {
        VStack {
            ZStack {
                Color.cyan.ignoresSafeArea()
                if singIn {
                    Text("profileview")
                }
                else {
                  OnboradingView()
                }
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
