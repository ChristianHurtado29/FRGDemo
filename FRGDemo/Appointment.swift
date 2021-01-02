//
//  Appointment.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import Foundation

struct Appointment: Codable {
    let barber:  Barber
    let customer: String
    let date: Date
}
