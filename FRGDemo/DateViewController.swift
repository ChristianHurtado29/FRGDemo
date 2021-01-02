//
//  DateViewController.swift
//  FRGDemo
//
//  Created by Christian Hurtado on 1/1/21.
//

import UIKit

protocol TimeDelegate: NSObjectProtocol {
    func time(data: String)
}

class DateViewController: UIViewController {
    
    weak var delegate : TimeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
