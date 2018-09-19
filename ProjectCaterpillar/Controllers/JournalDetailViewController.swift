//
//  JournalDetailViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class JournalDetailViewController: UITableViewController {
    let lifeStages = ["Egg", "Caterpillar", "Butterfly"]
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lifestageLabel: UILabel!
    
    @IBOutlet weak var detailsView: UITextView!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var lifestagePicker: UIPickerView!
    
    
    var entry1 = JournalEntry(title: "Example Entry", stageOfLife: egg, details: "Found this egg and it's sweet", date: "Sep 18 2018")

    override func viewDidLoad() {
        super.viewDidLoad()
        enableLifestagePicker()
        toggleFieldVisibility()
        togglePickerVisibility()
        
        titleLabel.text = entry1.title
        dateLabel.text = entry1.date
        lifestageLabel.text = entry1.stageOfLife.name
        detailsView.text = entry1.details
    }
    
    func enableLifestagePicker() {
        lifestagePicker.delegate = self
        lifestagePicker.dataSource = self
    }
    
    func toggleLabelVisibility() {
        titleLabel.isHidden = !titleLabel.isHidden
        dateLabel.isHidden = !dateLabel.isHidden
        lifestageLabel.isHidden = !lifestageLabel.isHidden
    }
    
    func toggleFieldVisibility() {
        titleField.isHidden = !titleField.isHidden
        dateField.isHidden = !dateField.isHidden
    }
    
    func togglePickerVisibility() {
        lifestagePicker.isHidden = !lifestagePicker.isHidden
    }
    
    @IBAction func editButton(_ sender: Any) {
        toggleFieldVisibility()
        toggleLabelVisibility()
        togglePickerVisibility()
    }
}

extension JournalDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
