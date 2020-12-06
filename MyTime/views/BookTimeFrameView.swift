//
//  BookTimeFrameView.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import SwiftUI

struct BookTimeFrameView: View {
    //@State private var user : User = User(name: "B_name", email: "B_email", phoneNumber: "000-000-0000",
                          //                timeSchadual:
                          //              TimeScahadual(hoursAvailability: 8, availableFrom: Date(), offOn: Date.init(timeIntervalSinceNow: 86400), appointmentDuration: 1, dateListBooked: Date()))
    @State private var selection:Int = 0
    @State private var listTimeSlots:[Date] = []
    //Data() formated as
    //Friday, November 20, 2020 ar 12:30:54 AM Eastern Standad Time
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
         //   Text("Business Name: \(user.name)")
         //       Text ("Available from: \(getDateFormatedToYMD(date: //user._timeSchadual.getAvailable()))")
        //        Text ("Off on: \(getDateFormatedToYMD(date: user._timeSchadual.getOffOn()))")
        //        Text (String(format: "Available Hours/day: \(getDurationFormated(num: user._timeSchadual.getDuration()))",user._timeSchadual.getDuration()  ))

                
                Section(header: Text("Hours Availability")){
                HStack{
                    Picker(selection:$selection,label:Text("Hours Availability")){
                //        ForEach (0 ..< getTimeSlotes().count){
              //              item in Text("\( listTimeSlots[item])")
                  //      }
                    }//.pickerStyle(SegmentedPickerStyle())
                }
                }
 
            //.navigationBarTitle()
            }//VStack
            .padding()
        }//NavigationView
        .onAppear(){
       //     getTimeSlotes()
        }
        
    }
    //can be add to the utilality as static function
    func getDateFormatedToYMD(date:Date?) -> String {
        let calendar = Calendar.current
        let stry = calendar.component(.year, from: date!)
        let strm = calendar.component(.month, from: date!)
        let strd = calendar.component(.day, from: date!)
        return "\(stry)/\(strm)/\(strd)"
    }
    //in case of 1,2,3 -> 1,2,3
    //in case of 1.5,2.5 -> 1.5, 2.5
    func getDurationFormated(num:Double) -> String{
        let num1 = Double(Int(num))
        if (num != num1){
            return "%.1f"
        }else{
            return "%.f"
        }
    }
    //getTimeSlotes(appointmentDuration: user._timeSchadual.getDuration(), hoursAvailability: user._timeSchadual.getHoursAvailability()!, startingDate: user._timeSchadual.getAvailable()!)
    //this function is in the wrong place but for better demo
    //func getTimeSlotes() -> [Date]{
     //   var tempAvailability:Double = Double(user._timeSchadual.getHoursAvailability()!)
     //   var temTimeStart = user._timeSchadual.getAvailable()!
    //    while tempAvailability > 0 {
    //        listTimeSlots.append(temTimeStart.addingTimeInterval(user._timeSchadual.getDuration() * 60 * 60))
    //        temTimeStart = temTimeStart.addingTimeInterval(user._timeSchadual.getDuration() * 60 * 60)
    //        tempAvailability = tempAvailability - user._timeSchadual.getDuration()
        
       // }
    //    print(#function,listTimeSlots)
   //     return listTimeSlots
    
}

struct BookTimeFrameView_Previews: PreviewProvider {
    static var previews: some View {
        BookTimeFrameView()
    }
}
