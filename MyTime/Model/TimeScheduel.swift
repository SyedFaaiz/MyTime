//
//  TimeScheduel.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-11-18.
//

import Foundation
class TimeScheduel{
    public var _id:UUID
    public var _hoursAvailability: [Int]
    public var _dateAvailability:[Date]
    public var _datdListBooked:[Date]
    
    init (id:UUID, hoursAvailability: [Int],dateAvailability: [Date],datdListBooked:[Date]) {
    self._id = id
    self._hoursAvailability = hoursAvailability
    self._dateAvailability = dateAvailability
    self._datdListBooked = datdListBooked
    }
    
    
}
