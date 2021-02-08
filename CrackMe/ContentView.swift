//
//  ContentView.swift
//  CrackMe
//
//  Created by Karim Baydon
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var alertIdentifier: AlertIdentifier?
    
    struct AlertIdentifier: Identifiable {
        enum Choice {
            case error, success
        }
        var id: Choice
    }

    var body: some View {
        VStack(alignment: .center, spacing: 11.0) {
            Image("cm")
                .padding(.top)
            Text("Please enter the right username and password.")
                .padding(.bottom)
            
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            
            Button(action: signIn) {
                Text("Let me in!")
            }
            .alert(item: $alertIdentifier) { alert in
                switch alert.id {
                    case .error:
                        return Alert(title: Text("Failure"), message: Text("Try again"), dismissButton: .default(Text("Go back!")))
                    case .success:
                        return Alert(title: Text("Success"), message: Text("ACCESS GRANTED"), dismissButton: .default(Text("Go back!")))
                }
            }
        }
        .padding([.leading, .bottom, .trailing], 26.0)
        .frame(width: 400.0)
    }
    
    func signIn()  {
        if isRightUsername() {
            self.alertIdentifier = AlertIdentifier(id: .error)
            return
        }
        
        if isRightLength() {
            self.alertIdentifier = AlertIdentifier(id: .error)
            return
        }
        
        if containsProtocol() {
            self.alertIdentifier = AlertIdentifier(id: .success)
            return
        }
        
        self.alertIdentifier = AlertIdentifier(id: .error)
    }
    
    func isRightUsername() -> Bool {
        return username != "johndoe"
    }
    
    func isRightLength() -> Bool {
        return password.count < 32;
    }
    
    func containsProtocol() -> Bool {
        let base64Decoded : String = Data(base64Encoded: password, options: Data.Base64DecodingOptions(rawValue: 0)).map({ String(data: $0, encoding: .utf8) })!!
        
        return base64Decoded.contains("https://")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
