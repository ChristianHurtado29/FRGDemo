//
//  PersistenceHelper.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error)
    case fileDoesNotExist(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    private var appointments = [Appointment]()
    
    private var filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    private func save() throws {
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        do {
            let data = try PropertyListEncoder().encode(appointments)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    public func reorderEvents(appointments: [Appointment]) {
        self.appointments = appointments
        try? save()
    }
    
    public func create(item: Appointment, indexPath: Int) throws {
        do {
            appointments = try loadEvents()
        } catch {
            print("error while creating appointment")
        }
        appointments.append(item)
        do {
            try save()
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    public func loadEvents() throws -> [Appointment] {
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        if FileManager.default.fileExists(atPath: url.path) {
            if let data = FileManager.default.contents(atPath: url.path) {
                do {
                    appointments = try PropertyListDecoder().decode([Appointment].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
            } else {
                throw DataPersistenceError.noData
            }
        }
        return appointments
    }
    
    public func delete(appointment index: Int) throws {
        let _ = try? loadEvents()
        appointments.remove(at: index)
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
}
