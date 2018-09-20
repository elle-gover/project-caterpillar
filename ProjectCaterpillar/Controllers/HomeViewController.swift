//
//  HomeViewController.swift
//  ProjectCaterpillar
//
//  Created by Elle Gover on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let lifeStagesDatabase = LifestagesDatabase()
    var user: User?
    var pet: Swallowtail?
    var lifeStages: [LifeStage] = []
    var userPetIcon = "Butterfly"
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var petNameTextField: UITextField!

    @IBOutlet weak var homeScreenImage: UIImageView!
    @IBAction func addButton(_ sender: UIButton) {
       collectUserData()
        toggleDisplayData()
    loadImage(image: updatePetIcon())
     
    }
    
    @IBOutlet weak var userDisplayLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    
    @IBOutlet weak var nameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePicker: UIPickerView!
    @IBOutlet weak var petNameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePickerDisplayLabel: UILabel!
    
    @IBOutlet weak var infoDisplayLabel: UILabel!
    
    
    func loadImage(image: String) {
        homeScreenImage.image = UIImage(named: image)

    }
    
    func updatePetIcon() -> String {
        guard let userPetIcon = pet?.stageOfLife.iconFile else { return "Butterfly" }
    return userPetIcon
    }
    
    
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifeStages[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifeStages.count
    }

    func collectUserData()  {
        let newUserName = userNameTextField.text!
        pet?.name = petNameTextField.text!
        pet?.stageOfLife = lifeStages[lifeStagePicker.selectedRow(inComponent: 0)]
        user = User(name: newUserName, pet: pet!)

        
    }
    
    func populateLifeStage() {
        for stage in lifeStagesDatabase.lifestages {
            lifeStages.append(stage)
        }
    }
    
    func toggleDisplayData() {
        lifeStagePicker.isHidden = true
        userNameTextField.isHidden = true
        userDisplayLabel.isHidden = true
        petNameTextField.isHidden = true
        nameDisplayLabel.isHidden = false
        petNameDisplayLabel.isHidden = false
        petNameLabel.isHidden = true
        lifeStagePickerDisplayLabel.isHidden = true
        nameDisplayLabel.text = "Welcome \(user!.name)!"
        petNameDisplayLabel.text = "Your pet \(pet!.name) is the \(pet!.stageOfLife.name)!" 
        addButtonOutlet.isHidden = true
        infoDisplayLabel.isHidden = false
        infoDisplayLabel.text = "Click the lifestages tab below to learn more about your new pet, or check out the journal to keep track of your pet’s progress! \n\nToday's Date: \(formattedDate())"

    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let today = Date()
        let todayString = dateFormatter.string(from: today)
        let formattedToday = dateFormatter.date(from: todayString)
        
        return dateFormatter.string(from: formattedToday!)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage(image: userPetIcon)
        populateLifeStage()
        userNameTextField.becomeFirstResponder()
        nameDisplayLabel.isHidden = true
        petNameDisplayLabel.isHidden = true
        infoDisplayLabel.isHidden = true
        
        var swallowTail = Swallowtail(name: "", startDate: "", imgFileName: "", stageOfLife: lifeStagesDatabase.lifestages[0])
        pet = swallowTail
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
