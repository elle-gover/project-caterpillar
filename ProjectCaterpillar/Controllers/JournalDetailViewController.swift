//
//  JournalDetailViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

protocol JournalDetailViewControllerDelegate: class {
    func detailVC(_ controller: JournalDetailViewController, didFinishEditing item: JournalEntry)
}

class JournalDetailViewController: UITableViewController {
    
    // MARK: - Properties
    let lifeStagesDatabase = LifestagesDatabase()
    var lifeStages: [LifeStage] = []
    weak var delegate: JournalDetailViewControllerDelegate?
    var entryToShow: JournalEntry?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lifestageLabel: UILabel!
    @IBOutlet weak var detailsView: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var lifestagePicker: UIPickerView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        populateLifeStage()
        displayEntryData()
        populateTextFields()
        enableLifestagePicker()
        toggleEditItems()
    }
    
    func displayEntryData() {
        guard let entry = entryToShow else { return }
        titleLabel.text = entry.title
        dateLabel.text = entry.date
        lifestageLabel.text = entry.stageOfLife.name
        detailsView.text = entry.details
    }
    
    func populateTextFields() {
        guard let entry = entryToShow else { titleField.text = ""; dateField.text = "" ; return }
        titleField.text = entry.title
        dateField.text = entry.date
    }
    
    func populateLifeStage() {
        for stage in lifeStagesDatabase.lifestages {
            lifeStages.append(stage)
        }
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
    
    func toggleSaveButtonIsEnabled() {
        saveBarButton.isEnabled = !saveBarButton.isEnabled
    }
    
    func toggleEditItems() {
        toggleFieldVisibility()
        togglePickerVisibility()
        toggleSaveButtonIsEnabled()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func editButton(_ sender: Any) {
        titleField.becomeFirstResponder()
        toggleEditItems()
        toggleLabelVisibility()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let entryToUpdate = entryToShow else { return }
        
        guard let updatedTitle = titleField.text else { return }
        entryToUpdate.title = updatedTitle
        
        guard let updatedDate = dateField.text else { return }
        entryToUpdate.date = updatedDate
        
        let updatedLifeStage = lifeStages[lifestagePicker.selectedRow(inComponent: 0)]
        entryToUpdate.stageOfLife = updatedLifeStage
        
        guard let updatedDetails = detailsView.text else { return }
        entryToUpdate.details = updatedDetails
        
        delegate?.detailVC(self, didFinishEditing: entryToUpdate)
    }
}

extension JournalDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifeStages[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifeStages.count
    }
}
