//
//  ContentView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 19.01.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String, username: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                return
            }

            let data = [
                "username": username
            ]

            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(data) { error in
                guard error == nil else {
                    return
                }

                DispatchQueue.main.async {
                    self?.signedIn = true
                }
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }

                    MapView()
                        .environmentObject(LocationsViewModel())
                        .tabItem {
                            Image(systemName: "map")
                            Text("Map")
                    }
                }

            }else{
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150 )
                
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                    
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                    
                Button {
                        
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                        
                } label: {
                    Text("Sign In")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(20)
                }
                NavigationLink("Create Account", destination: SignUpView())
                    .padding()
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Sign In")
    }
}

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var username = ""

    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150 )
                
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                
                TextField("Username", text: $username)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                    
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                    
                Button {
                        
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password, username: username)
                        
                } label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(20)
                }
            }
            .padding()
            
            Spacer()
                
        }
        .navigationTitle("Create Account")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
