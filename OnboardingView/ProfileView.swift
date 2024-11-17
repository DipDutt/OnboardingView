//
//  ProfileView.swift
//  OnboardingView
//
//  Created by Dip Dutt on 18/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("sign_in") var currentUsersingIn: Bool = false
    @AppStorage("name") var currentUsername: String?
    @AppStorage("AGE") var currentUserage: Int?
    @AppStorage("Gender") var currentUsergender: String?
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
        }
    }
}

#Preview {
    ProfileView()
}
