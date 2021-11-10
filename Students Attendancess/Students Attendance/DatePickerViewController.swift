//
//  DatePickerViewController.swift
//  Students Attendance
//
// Created by PC on 05/04/1443 AH..
//

import UIKit
import Firebase

class DatePickerViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(datePicker)
        view.backgroundColor = UIColor.white
        
        NSLayoutConstraint.activate([
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    lazy var datePicker : UIDatePicker = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .inline
        return $0
    }(UIDatePicker())
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "dd MMM, YYYY"
        let dateString = dateFormatter.string(from: datePicker.date)

        var data : [String : Any] = [:]
        
        for i in StudentsViewController.students {

            data.updateValue(["name" : i.name!, "status" : false, "timestamp" : String(Date().timeIntervalSince1970) ], forKey: UUID().uuidString)
        }
        
        addnewDay(day: dateString, data: data)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func addnewDay(day : String, data : [String : Any]) {
        Firestore.firestore().collection("Days").document(day).setData(data)
    }
    
}
