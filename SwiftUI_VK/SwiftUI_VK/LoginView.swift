//
//  ContentView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 09.02.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
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
                    
                    Button {
                        print("Login...")
                    } label: {
                        if login.isEmpty || password.isEmpty {
                            Text("Log in")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 200, height: 50, alignment: .center)
                        } else {
                            Text("Log in")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50, alignment: .center)
                        }
                        
                    }
                    .disabled(login.isEmpty || password.isEmpty)
                    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
