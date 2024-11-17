//
//  OnboradingView.swift
//  OnboardingView
//
//  Created by Dip Dutt on 17/11/24.
//

import SwiftUI

struct OnboradingView: View {
    // MARK: - PROPERTIES
    @State var updateViewCount = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch updateViewCount {
                case 0 :
                   Text( "welcomeView")
                case 1:
                    Text( "NameView")
                case 2:
                    Text( "genderView")
                case 3:
                    Text( "View")
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                    
                }
                
                VStack {
                    Button("press") {
                        updateViewCount += 1
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
}

// MARK: - creation extesion for button
extension OnboradingView {
    
}

#Preview {
    OnboradingView()
}
