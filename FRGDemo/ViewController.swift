//
//  ViewController.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import UIKit
import FSCalendar


class ViewController: UIViewController {
    
    @IBOutlet weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }


}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}
