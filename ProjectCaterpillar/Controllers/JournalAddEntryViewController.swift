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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lifestagePicker.dataSource = self
        lifestagePicker.delegate = self
    }

    let lifeStages = ["Egg", "Caterpillar", "Butterfly"]
    
    @IBAction func save() {
        guard let entry = newEntry else { return }
        delegate?.add(self, didFinishAdding: entry)
    }
    
    @IBAction func cancel() {
        delegate?.addDidCancel(self)
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
