//
//  addstuden.swift
//  attendance
//
//  Created by Hassan Yahya on 29/03/1443 AH.
//


import UIKit
import Firebase
import FirebaseFirestore

class AddStudent: UIViewController {
	
	var addstudentTxt = UITextField()
	let datePicker = UIDatePicker()
	let BtnOK = UIButton()
	
	
	var callbackClosure: (() -> Void)?
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		callbackClosure?()
	}
	
	
	
	override func viewDidLoad(){
		super.viewDidLoad()
		
		createDatePicker()
		
		
		
		
		view.backgroundColor = .lightGray
		addstudentTxt.placeholder = "Add Student"
		addstudentTxt.textAlignment = .center
		addstudentTxt.translatesAutoresizingMaskIntoConstraints = false
		addstudentTxt.textColor = .black
		addstudentTxt.font = UIFont.systemFont(ofSize: 18)
		addstudentTxt.backgroundColor = .systemGray5
		
		view.addSubview(addstudentTxt)
		
		NSLayoutConstraint.activate([
			addstudentTxt.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			addstudentTxt.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			addstudentTxt.widthAnchor.constraint(equalToConstant: 300)
		])
		
		BtnOK.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(BtnOK)
		BtnOK.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
		NSLayoutConstraint.activate([
			BtnOK.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
			BtnOK.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300)
		])
		BtnOK.backgroundColor = UIColor.lightGray
		BtnOK.setTitle(" Write Students's Name", for: .normal)
		
		func buttonAction(sender: UIButton!) {
			let btnsendtag: UIButton = sender
			if btnsendtag.tag == 1 {
				
				dismiss(animated: true, completion: nil)
			}
		}
		
	}
	
	func createDatePicker(){
		
		addstudentTxt.textAlignment = .center
		
		//		let toolbar = UIToolbar()
		//		toolbar.sizeToFit()
		//
		//		let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector (donePressed))
		//		toolbar.setItems ([doneBtn], animated: true)
		//
		//		addstudentTxt.inputAccessoryView = toolbar
		//		datePicker.preferredDatePickerStyle = .wheels
		//		birthDateTxt.inputView = datePicker
		//		datePicker.datePickerMode = .date
	}
	
	@objc func donePressed() {
		
		
		
		guard let add = addstudentTxt.text  else {return}
		Firestore.firestore().collection("students")
			.addDocument(data:[
				"name" : add,
				"attendance" : true
			])
		
		addstudentTxt.text = ""
		
		dismiss(animated: true)
		
		
	}
	
}


