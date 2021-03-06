//
//  Barber.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import Foundation

struct Barber: Codable {
    let name: String
    let appointments: [Appointment]
    let workDays: [String]
}
