//
//  User.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-11-18.
//

import Foundation
struct User{
    private var id: UUID
    private var name:String = ""
    private var email:String = ""
    private var password:String = ""
    
    
    // TimeScahadual Used in a diffrent View to make selection for it's Type
    
    // id:UUID, hoursAvailability: [Int],dateAvailability: [Date],datdListBooked:[Date]
    private var timeScheduel: TimeScheduel
    private var phoneNumber: String = ""
    public var rememberMe: Bool = true

    init(id: UUID, name:String,email:String,password:String,phoneNumber:String, timeScheduel: TimeScheduel){
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.timeScheduel = timeScheduel
    }
 
}
