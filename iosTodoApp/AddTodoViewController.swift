//
//  AddTodoViewController.swift
//  iosTodoApp
//
//  Created by Rafael Rodrigues Ghossi on 4/4/17.
//  Copyright © 2017 Rafael Rodrigues Ghossi. All rights reserved.
//

import UIKit
import RealmSwift

class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var todoTitleTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var prioritySlider: UISlider!
    
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveTodo(_ sender: UIBarButtonItem) {
        todo = Todo()
        todo?.title = todoTitleTextField.text ?? ""
        todo?.dueDate = dueDatePicker.date
        todo?.priority = Int(self.prioritySlider.value)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(todo!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

