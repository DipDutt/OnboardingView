//
//  OnboradingView.swift
//  OnboardingView
//
//  Created by Dip Dutt on 17/11/24.
//

import SwiftUI

struct OnboradingView: View {
    // MARK: - PROPERTIES
    @State var updateOnboardingState = 0
    @State var name:String = ""
    @State var age:Double = 0
    @State var gender:String = "MALE"
    let viewTransition:AnyTransition = .asymmetric(insertion:.move(edge: .trailing), removal: .move(edge: .leading))
    @AppStorage("sign_in") var currentUsersingIn: Bool = false
    @AppStorage("name") var currentUsername: String?
    @AppStorage("AGE") var currentUserage: Int?
    @AppStorage("Gender") var currentUsergender: String?
    
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            ZStack {
                switch  updateOnboardingState{
                case 0 :
                    welcomeView
                        .transition(viewTransition)
                case 1:
                    nameView
                        .transition(viewTransition)
                case 2:
                    ageView
                        .transition(viewTransition)
                case 3:
                    genderView
                        .transition(viewTransition)
                default:
                    Text("")
                    
                }
                
                // MARK: - Action Button.
                VStack {
                    butttonView
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
        }
    }
}

// MARK: - creation extesion for DifferentViews

extension OnboradingView {
    
    // MARK: - Create butttonView
    private var butttonView: some View {
        Text(updateOnboardingState == 0 ? "Sign Up": updateOnboardingState == 3 ? "Finish": "Next")
            .font(.title)
            .foregroundStyle(Color.cyan)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
            .onTapGesture {
                pressNextButton()
            }
        
    }
    
    // MARK: - Create pressNextButton
    private func pressNextButton() {
        
        if updateOnboardingState >= 3 {
                signIn()
        }
        withAnimation(.easeInOut) {
            updateOnboardingState += 1
        }
    }
    
    
    // MARK: - Create signIn Fuction
    
    private func signIn() {
        currentUsername = name
        currentUserage = Int(age)
        currentUsergender = gender
        withAnimation(.spring) {
            currentUsersingIn = true
        }
        
    }
    
    // MARK: - Create WelcomeView
    
    private var welcomeView: some View {
        VStack(spacing: 10) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color.white)
            
            Text(" Find your match")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.red)
            
            Text("This is the number 1 app to finding your match, where you can find your partner.")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.blue)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding()
        
    }
    
    // MARK: - Create nameView
    
    private var nameView: some View {
        VStack {
            Spacer()
            Text("Your name section")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            TextField("enter your name here", text: $name)
                .padding()
                .frame(height: 55)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 20))
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 20)
        
    }
    
    
    // MARK: - Create ageView
    
    private var ageView: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Your age selection")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            Text(" selection age is : \(String(format: "%.0f", age))")
                .font(.title)
                .fontWeight(.bold)
            Slider(value: $age, in: 18...60, step: 1)
                .tint(Color.green)
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 20)
        
    }
    
    
    // MARK: - Create genderView
    
    private var genderView: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Select your gender")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            Picker(
                selection:$gender) {
                    Text("MALE").tag("MALE")
                    Text("FEMALE").tag("FEMALE")
                    Text("NON-BINARY").tag("NON-BINARY")
                } label: {
                    Text("selecet your gender")
                        .font(.headline)
                        .foregroundStyle(Color.red)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 20))
                }
                .pickerStyle(.menu)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 20)
        
    }
    
}

#Preview {
    OnboradingView()
}
