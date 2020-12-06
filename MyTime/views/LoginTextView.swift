//
//  LoginTextView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import SwiftUI

struct LoginTextView: View {
    @EnvironmentObject var userViewModel : UserViewModel
    @EnvironmentObject var userSetting : UserSetting
    
    @State private var email: String =  UserDefaults.standard.string(forKey: "KEY_EMAIL") ?? ""
    @State private var password: String = UserDefaults.standard.string(forKey: "CA_MIKHAILAJAJ_MYTIME_PASSWORD") ?? ""
    @State private var rememberInfo: Bool = true
    @State private var selection: Int? = nil
    @State private var invalidLogin: Bool = false
    
    var body: some View {
        NavigationView{
                   
                   VStack( spacing: 5){
                    NavigationLink(destination: SignUpView(), tag: 1, selection: $selection) {}
                    NavigationLink(destination: Dashboard(), tag: 2, selection: $selection) {}
                    
                       HStack{
                       TextField("Email",text: $email)
                       }
                       HStack{
                       TextField("Password",text: $password)
                       }
                       HStack{
                           Toggle(isOn: $rememberInfo){
                               Text("Remember me").font(.footnote)
                           }
                       }
                    
                       HStack(alignment: .center){
                        Button(action: {
                                print("Login Clicked")
                            if (self.isValidData()){
                                if (self.validateUser()){
                                    print("Login Successful")
                                    
                                    //save login credentials to UserDefaults
                                    if (self.rememberInfo){
                                        //save to UserDefaults
                                        UserDefaults.standard.setValue(self.email, forKey: "KEY_EMAIL")
                                        UserDefaults.standard.setValue(self.password, forKey: "CA_MIKHAILAJAJ_MYTIME_PASSWORD")
                                    }else{
                                        //remove from UserDefaults
                                        UserDefaults.standard.removeObject(forKey: "KEY_EMAIL")
                                        UserDefaults.standard.removeObject(forKey: "CA_MIKHAILAJAJ_MYTIME_PASSWORD")
                                    }
                                    userSetting.userEmail = self.email
                                self.selection = 2
                                }else{
                                    print("Incorrect email/password.")
                                    self.invalidLogin = true
                                }
                            }
                            })
                            {
                                Text("Login")
                            }
                        .alert(isPresented: self.$invalidLogin){
                            Alert(
                                title: Text("Error"),
                                message: Text("Incorrect Login/Password"),
                                dismissButton: .default(Text("Try Again !"))
                            )
                        }//alert
                        }
                       Spacer()
                       
                       
                       //it is not working well
                       VStack{
                        NavigationLink(destination: TimeManagerView(), tag: 3, selection: $selection) {}
                           HStack(alignment: .center){
                            Button(action: {
                                print("Create Account clicked")
                              
                                    self.selection = 1
                                  
                            })
                            {
                                Text("Sign Up").font(.title)
                            }
                           }
                        
                        HStack(alignment: .center){
                        Button(action: {
                            print("Time Manager View clicked")
                          
                                self.selection = 3
                              
                        })
                        {
                            Text("Add Time Schedule").font(.title)
                        }
                        }
                           Button(action: {
                               // TODO: API forget password
                               // TODO: new View ask for Email
                               // TODO: the new View send request to database
                               // 1- creates new request API send the email
                               // 2- when confirmed email (new View with two Text fields _password and conform password)
                               // 3- change the data in the database + core data in the device
                               // 4- redirect the user to the Dashbord :)
                            self.removeUser()
                               print("Account resetted")
                               
                       
                           }){
                               Text("Forget Password! Click here to reset account")
                                   .foregroundColor(Color.blue)
                               }
                           }
                           
                       
                       Spacer()
                       HStack{
                           NavigationLink(destination: MapView()){
                               Text("Map")
                             
                           }
                           
                           NavigationLink(destination: BookTimeFrameView()){
                               Text("Book An appointment")
                           }
                               //pressing the word map alows the user to surff over all the location provider demo
                       }
               
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

                                           }
                                                                       
                   )
                   
               }//NavigationView
               .onAppear(){
                self.userViewModel.getAllUsers()
                
                for user in self.userViewModel.userList{
                    print(#function, "Name : \(user.name ?? "Unknown") Email: \(user.email!) Phone Number: \(user.phoneNumber ?? "Unknown") Password: \(user.password!)")
                }
               }
    }
    
    private func removeUser(){
        self.userViewModel.deleteUser()
      //  self.presentationMode.wrappedValue.dismiss()
    }

    
    private func isValidData() -> Bool{
       
        if self.email.isEmpty{
            return false
        }
        
        if self.password.isEmpty{
            return false
        }
        
        return true
    }
    
    private func validateUser() -> Bool{
        self.userViewModel.findUserByEmail(email: self.email)
        
        if (self.userViewModel.loggedInUser != nil){
            if (self.password == self.userViewModel.loggedInUser!.password){
                return true
            }
        }else{
            self.invalidLogin = true
            
            return false
        }
        return false
    }
}

struct LoginTextView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextView()
    }
}
