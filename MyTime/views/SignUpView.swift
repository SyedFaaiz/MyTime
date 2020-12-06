//
//  SignUpView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel : UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name :String = ""
    @State private var phoneNumber :String = ""
    @State private var address :String = ""
    @State private var email :String = ""
    @State private var password :String = ""
    @State private var saveMyInfo : Bool = true
    @State private var timeAvailabilityList = [0,4,8,12,16]
    @State private var timeAvailability:Int = 0
    @State private var AvailableFrom:Date = Date()
    @State private var offOnDate:Date = Date()
    var body: some View {
        NavigationView{
            
            //VStack(){
                Form{
                /*
                Section{
                HStack(alignment: .center){
                    Text("Sign Up").font(.title)
                }
                }
 */
                Section{
                HStack{
                TextField("Full name",text: $name)
                }
                }
                Section{
                HStack{
                TextField("Phone#",text: $phoneNumber)
                }
                }
                Section{
                HStack{
                TextField("Address",text: $address)
                }
                }
                Section{
                HStack{
                TextField("Email",text: $email)
                }
                }
                Section{
                HStack{
                TextField("Password",text: $password)
                }
                }
                Section(header: Text("Hours Availability")){
                HStack{
                    Picker(selection:$timeAvailability,label:Text("Hours Availability")){
                        ForEach (0 ..< timeAvailabilityList.count){
                            item in Text("\( timeAvailabilityList[item])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                }
                // Next View saved data on the device
                //DatePicker("You are available from", selection: $AvailableFrom, displayedComponents: .date)
                //DatePicker("You are off on", selection: $offOnDate, displayedComponents: .date)
                HStack{
                    Toggle(isOn: $saveMyInfo){
                        Text("remember me?")
                    }
                }
                HStack(alignment: .center){
                    Button(action:{
                        print("Signed Up!")
                        self.addNewUser()
                    })
                    {
                        Text("Sign Up")
                    }
                   // NavigationLink(destination: TimeManagerView()){
                   //     Text("Next")
                   // }
                }
                }
                //Spacer()
//
                
            //}//VStack
            }
    }
    func addNewUser()
    {
        self.userViewModel.insertUser(name: self.name, email: email, password: password, phoneNumber: phoneNumber, address: address)
        //pop current View from the stack
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
