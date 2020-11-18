//
//  SignUpView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-11-18.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName :String = ""
    @State private var phone :String = ""
    @State private var address :String = ""
    @State private var email :String = ""
    @State private var password :String = ""
    @State private var saveMyInfo : Bool = true
    var body: some View {
        NavigationView{
            VStack( spacing: 10){
                HStack(alignment: .center){
                    Text("Sign Up").font(.title)
                }
                HStack{
                TextField("Full name",text: $fullName)
                }
                HStack{
                TextField("Phone#",text: $phone)
                }
                HStack{
                TextField("Address",text: $address)
                }
                HStack{
                TextField("Email",text: $email)
                }
                HStack{
                TextField("Password",text: $password)
                }
                HStack{
                    Toggle(isOn: $saveMyInfo){
                        Text("remember me?")
                    }
                }
                HStack(alignment: .center){
                    NavigationLink(destination: Dashboard()){
                        Text("Sign Up")
                    }
                }
                Spacer()
//
                
            }//VStack
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    HStack{
                                        //we can add some function when the user click the logo
                                    Image("Logo").resizable()
                    .aspectRatio(contentMode: .fit)
                                        .frame(width: 70, height: 70, alignment: .center)
                                    Text("MyTime").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

                                    })
            
        }//NavigationView
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
