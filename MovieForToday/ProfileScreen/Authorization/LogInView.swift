//
//  LogIn View.swift
//  MovieForToday
//
//  Created by Daniil Kulikovskiy on 12/27/23.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @StateObject var viewModel = SignInViewModel()
    @Binding var showSignInView: Bool
    init(showSignInView: Binding<Bool>) {
        self._showSignInView = showSignInView
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: PrimaryColor.mint.rawValue) ?? .white]
    }
    
    var body: some View {
        ZStack {
            Color((PrimaryColor.softDark.rawValue))
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                
                CustomTextField(value: $viewModel.email, titleBorder: "Login", offsetNameX: -130, offsetNameY: -28, placeHolder: "Enter your mail")
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                CustomSecureField(value: $viewModel.password, titleBorder: "Password", offsetNameX: -118, offsetNameY: -28, placeHolder: "Enter your password")
                    .autocapitalization(.none)
                
                HStack {
                    Spacer()
                    NavigationLink {
                        ReturnPassword()
                    } label: {
                        Text("forgot password?")
                            .font(.custom(.montMedium, size: 14))
                    }
                    .offset(y: -10)
                    .padding(.top, 0)
                    .padding(.trailing, 20)
                }
                
                Spacer()
                
                NavigationLink(destination: {
                    Registration()
                }, label: {
                    Text("Registration")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .font(.custom(.montMedium, size: 16))
                        .background(.black)
                        .cornerRadius(32)
                        .padding(.horizontal, 16)
                })
                
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signIn()
                            if Auth.auth().currentUser != nil {
                                self.showSignInView = false
                            }
                            return
                        } catch {
                            print(error)
                        }
                    }
                }) {
                    Text("LogIn")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .font(.custom(.montMedium, size: 16))
                        .background(Color(PrimaryColor.mint.rawValue))
                        .cornerRadius(32)
                }
                .padding(.horizontal, 16)
            }
            .padding()
        }
        .onChange(of: showSignInView) { showSignInView in
            if !showSignInView {
                Task {
                    do {
                        try? await viewModel.fetchUser()
                    }
                }
            }
        }
        .navigationTitle("Sign In")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    LogInView(showSignInView: .constant(false))
}
