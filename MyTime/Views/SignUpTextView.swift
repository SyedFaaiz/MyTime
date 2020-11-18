//
//  SignUpTextView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-11-18.
//

import SwiftUI

struct SignUpTextView: View {
    @State private var companyName :String = ""
    @State private var phone :String = ""
    @State private var numberOfEmployees :String = ""
    @State private var address :String = ""
    @State private var email :String = ""
    @State private var password :String = ""
    @State private var selection: Int? = nil
    @State private var rememberInfo: Bool = true
    var body: some View {
        NavigationView{
            VStack( spacing: 10){
                HStack(alignment: .center){
                    Text("Sign Up").font(.title)
                }
                HStack{
                    TextField("Company Name", text: $companyName)
                }
                HStack{
                    TextField("Phone", text: $phone)
                }
                HStack{
                    TextField("Number of Employees", text: $phone)
                }
                HStack{
                    TextField("Address", text: $address)
                }
                HStack{
                    TextField("Address", text: $email)
                }
                HStack{
                    TextField("Address", text: $password)
                }
                
                
                HStack{
                    Toggle(isOn: $rememberInfo){
                        Text("Remember me").font(.footnote)
                    }
                }
                
                HStack(alignment: .center){
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                    }}
               Spacer()
              
                 
            }
            .padding()
            .navigationBarTitle("MyTime")

        }
    }
}

struct SignUpTextView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextView()
    }
}
