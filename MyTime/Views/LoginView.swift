//
//  LoginView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-11-18.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberInfo: Bool = true
    @State private var selection: Int? = nil
    var body: some View {
        NavigationView{
            VStack( spacing: 5){
                HStack(alignment: .center){
                    Text("Login").font(.title)
                }
                HStack{
                    TextField("Email", text: $email)
                }
                HStack{
                    TextField("Password", text: $password)
                }
                HStack{
                    Toggle(isOn: $rememberInfo){
                        Text("Remember me").font(.footnote)
                    }
                }
         
                
                HStack(alignment: .center){
                    NavigationLink(destination: SignUpView()){
                        Text("Login")
                    }}
                Spacer()
                
                VStack{
                HStack
                {
                    Text("Sign Up").font(.title)
                }
                
                
                Button(action: {
                    print("Account resetted")
                    self.selection = 1
                }){
                    Text("Forget Password! Click here to reset account")
                        .foregroundColor(Color.blue)
                }
                }
                Spacer()
                
                
                 
            }
            .padding()
            .navigationBarTitle("MyTime")

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
