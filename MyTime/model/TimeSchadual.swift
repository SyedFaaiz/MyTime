//
//  TimeSchadual.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//


import Foundation
class TimeScahadual: ObservableObject{
    private var _id: UUID? = UUID()
    private var _hoursAvailability: Int? = 0
    private var _availableFrom: Date?
    private var _offOn:Date?
    private var _appointmentDuration: Double = 1
    private var _dateListBooked:[Date]? //Can be modified later to a list of integer --PROPLEM--
    init() {
    }
    init (hoursAvailability: Int,availableFrom: Date,offOn:Date,appointmentDuration:Double ,dateListBooked:Date) {
        self._hoursAvailability = hoursAvailability
        self._availableFrom = availableFrom
        self._availableFrom = availableFrom
        self._offOn = offOn
        self._appointmentDuration = appointmentDuration
    }
    func getAvailable()-> Date?{
        return self._availableFrom
    }
    func getOffOn() -> Date? {
        return self._offOn
    }
    func getDuration() -> Double {
        return self._appointmentDuration
    }
    func getDataList() -> [Date]? {
        return self._dateListBooked
    }
    func getHoursAvailability() -> Int? {
        return self._hoursAvailability
    }
    
}

