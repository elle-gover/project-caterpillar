//
//  JournalAddEntryViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

protocol JournalAddEntryViewControllerDelegate: class {
    func addDidCancel(_ controller: JournalAddEntryViewController)
    func add(_ controller: JournalAddEntryViewController, didFinishAdding item: JournalEntry)
}

class JournalAddEntryViewController: UITableViewController {
    
    // MARK: - Properties
    weak var delegate: JournalAddEntryViewControllerDelegate?
    var newEntry: JournalEntry?
    
    // MARK: - Outlets
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var lifestagePicker: UIPickerView!
    @IBOutlet weak var detailsView: UITextView!

    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lifestagePicker.dataSource = self
        lifestagePicker.delegate = self
        
        detailsView.text = "Write your entry here..."
        detailsView.textColor = UIColor.lightGray
        
        titleField.becomeFirstResponder()
        
        textViewDidEndEditing(detailsView)
    }

    // temporary lifestage data, replace w/ real lifestages from database
    let lifeStages = ["Egg", "Caterpillar", "Butterfly"]
    
    @IBAction func save() {
        let entry = createNewEntry()
        delegate?.add(self, didFinishAdding: entry)
    }
    
    @IBAction func cancel() {
        delegate?.addDidCancel(self)
    }
    
    func createNewEntry() -> JournalEntry {
        newEntry = JournalEntry(title: titleField.text!, stageOfLife: egg, details: detailsView.text!, date: dateField.text!)
        return newEntry!
    }
}

    // Journal entry textView placeholder function1
    func textViewDidBeginEditing(_ detailsView: UITextView) {
        
        if detailsView.textColor == UIColor.lightGray {
            detailsView.text = ""
            detailsView.textColor = UIColor.black
        } else {
            detailsView.textColor = UIColor.black
        }
        
    }
    // Journal entry textView placeholder function2
    func textViewDidEndEditing(_ detailsView: UITextView) {
        
        if detailsView.text.isEmpty {
            detailsView.text = "Write your entry here..."
            detailsView.textColor = UIColor.lightGray
        }
    }

extension JournalAddEntryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifeStages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifeStages.count
    }
}
