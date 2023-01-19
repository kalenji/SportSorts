//
//  ContentView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 19.01.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo ")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150 )
                
                VStack {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    SecureField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }

                    
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Sign In")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
