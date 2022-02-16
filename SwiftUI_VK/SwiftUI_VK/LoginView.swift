//
//  ContentView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 09.02.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @Binding var isUserLoggedIn: Bool
    
    //MARK: - Private Properties
    
    @State private var login = "admin"
    @State private var password = "admin"
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrentInputWarning = false
    
    private var inputIsValid: Bool {
        if login.isEmpty || password.isEmpty {
            return false
        }
        return true
    }
    
    private var buttonColor: Color {
        return inputIsValid ? .white : .gray
    }
    
    private let keyboardIsOnPublisher = Publishers.Merge (
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map {_ in true},
        
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map {_ in false}
    )
    
    //MARK: - Properties
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Image("Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width,
                           maxHeight: geometry.size.height)
            }
            
            ScrollView {
                VStack {
                    if shouldShowLogo {
                        Text("Вконтакте")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .font(.largeTitle)
                            .shadow(color: .gray, radius: 10, x: 0, y: 0)
                    }
                    Spacer(minLength: 60)
                    
                    VStack {
                        VStack {
                            Text("Login")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding()
                            
                            TextField("", text: $login)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(15)
                                .opacity(0.7)
                        }
                        
                        VStack {
                            Text("Password")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding()
                            
                            SecureField("", text: $password)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(15)
                                .opacity(0.7)
                        }
                    }.frame(width: 200, height: 240.0)
                    
                    Spacer(minLength: 100)
                    
                    Button(action: verifyLoginData) {
                        Text("Log in")
                            .font(.title2)
                            .foregroundColor(buttonColor)
                            .padding()
                            .frame(width: 200, height: 50, alignment: .center)
                    }
                    .disabled(!inputIsValid)
                    
                    Spacer()
                }
                .onReceive(keyboardIsOnPublisher) {isKeyboardOn in
                        withAnimation(Animation.easeInOut(duration: 0.25)) {
                            self.shouldShowLogo = !isKeyboardOn
                        }
                }
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
            
        }.alert(isPresented: $showIncorrentInputWarning, content: {
            Alert(title: Text("Error"),
                  message: Text("Incorrect Login or Password was entered."))
        })
    }
    
    //MARK: - Private functions
    
    private func verifyLoginData() {
        if login == "admin" && password == "admin" {
            isUserLoggedIn = true
        }
        else {
            showIncorrentInputWarning = true
        }
        password = ""
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
