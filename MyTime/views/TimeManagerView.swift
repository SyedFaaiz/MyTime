//
//  TimeManagerView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import SwiftUI

struct TimeManagerView: View {
    
    @EnvironmentObject var userViewModel : UserViewModel
    
    @State private var fullName :String = ""
    @State private var phone :String = ""
    @State private var address :String = ""
    @State private var email :String = ""
    @State private var password :String = ""
    @State private var saveMyInfo : Bool = true
    @State private var timeAvailabilityList = [0,4,8,12,16]
    @State private var timeAvailability:Int = 0
    @State private var AvailableFrom:Date = Date()
    @State private var offOnDate:Date = Date()
    @State private var AvailableFromTime:Date = Date()
    @State private var offOnTime:Date = Date()
    
//    var user = User(name: "Mikhail", email: "michelajaj96@gmail.com", password: "12345", phoneNumber: "110202", address: "3051 Driftwood Dr, Ontario, CA, L7M1X8")
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
      //              Text("Hello, \(user.name)!").font(.title)
                }
                }
                // Next View saved data on the device
                DatePicker("You are available from", selection: $AvailableFrom, displayedComponents: .date)
                DatePicker("You are off on", selection: $offOnDate, displayedComponents: .date)
                    
                    DatePicker("You are Available at", selection: $AvailableFromTime, displayedComponents: .hourAndMinute)
                    DatePicker("You are off at", selection: $offOnTime, displayedComponents: .hourAndMinute)
                
                HStack(alignment: .center){
                    //TODO: Save data (User) + (Availabilty)
                    //TODO: Validation Check!
                    //Data sent to be saved!
                    //
                    NavigationLink(destination: Dashboard()){
                        Text("submit")
                    }
                }
                }
                //Spacer()
    //
                
            //}//VStack
            }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
                                HStack(){
                                    
                                Text("MyTime").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    //we can add some function when the user click the logo
                                Image("Logo").resizable()
                .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70, alignment: .center)
                                })
        
        .navigationBarBackButtonHidden(true)
    }//NavigationView
    
}

struct TimeManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeManagerView()
    }
}
