//
//  ViewController.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import UIKit
import FSCalendar


class ViewController: UIViewController, TimeDelegate {
    
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var appointmentTable: UITableView!
    
    private var dateSelect = "" {
        didSet {
            self.dateSelect = dateSelect.description
            appointmentTable.reloadData()
        }
    }
    
    private var appointments = [Appointment]() {
        didSet {
            self.appointmentTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        appointmentTable.dataSource = self
        view.backgroundColor = .systemOrange
    }
    
    @IBAction func createAppointment(_ sender: UIBarButtonItem) {
        
    }
    


}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-dd-YYYY"
        let string = formatter.string(from: date)
        dateSelect = string
        print(string)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentCell") else {
            fatalError("could not dequeue cell")
        }
        cell.textLabel?.text = "hey"
        cell.detailTextLabel?.text = "Im here"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Appointments for \(dateSelect)"
    }
}

extension ViewController {
    func time(data: String) {
//        <#code#>
    }
}
