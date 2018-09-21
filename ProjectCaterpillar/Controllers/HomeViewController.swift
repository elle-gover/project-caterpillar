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
    @IBOutlet weak var updateUserButtonOutlet: UIButton!
    @IBOutlet weak var userDisplayLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var nameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePicker: UIPickerView!
    @IBOutlet weak var petNameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePickerDisplayLabel: UILabel!
    @IBOutlet weak var infoDisplayLabel: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let checkForFile = checkForLoadFile()
        populateLifeStage()
        print(dataFilePath())
        
        nameDisplayLabel.isHidden = true
        petNameDisplayLabel.isHidden = true
        
        if checkForFile {
            load()
            loadImage(image: updatePetIcon())
            toggleDisplayData()
        } else {
            userNameTextField.becomeFirstResponder()
            loadImage(image: userPetIcon)
            updateUserButtonOutlet.isHidden = true
            nameDisplayLabel.isHidden = true
            petNameDisplayLabel.isHidden = true
            infoDisplayLabel.isHidden = true
            var swallowTail = Swallowtail(name: "", startDate: "", stageOfLife: lifeStagesDatabase.lifestages[0])
            pet = swallowTail
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    func loadImage(image: String) {
        homeScreenImage.image = UIImage(named: image)
    }
    
    func updatePetIcon() -> String {
        guard let userPetIcon = pet?.stageOfLife.iconFile else { return "Butterfly" }
        
        return userPetIcon
    }
 
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
    
    func updateUserData() {
        infoDisplayLabel.isHidden = true
        updateUserButtonOutlet.isHidden = true
        addButtonOutlet.isHidden = false
        petNameDisplayLabel.isHidden = true
        nameDisplayLabel.isHidden = true
        lifeStagePickerDisplayLabel.isHidden = false
        petNameLabel.isHidden = false
        petNameDisplayLabel.isHidden = true
        nameDisplayLabel.isHidden = true
        petNameTextField.isHidden = false
        userDisplayLabel.isHidden = false
        userNameTextField.isHidden = false
        lifeStagePicker.isHidden = false
        dateLabel.isHidden = true
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
        nameDisplayLabel.text = "Welcome, \(user!.name)!"
        petNameDisplayLabel.text = "Your pet \(pet!.name) is in the \(pet!.stageOfLife.name)!" 
        addButtonOutlet.isHidden = true
        updateUserButtonOutlet.isHidden = false
        infoDisplayLabel.isHidden = false
        dateLabel.isHidden = false
        infoDisplayLabel.text = "Click the Lifestages tab below to learn more about your new pet, or check out the Journal to keep track of your pet’s progress!"
        dateLabel.text = "Today's Date: \(formattedDate())"
    }
    
    func checkForLoadFile() -> Bool {
       let fileManager = FileManager()
       let filePath = dataFilePath().path
       
       return fileManager.fileExists(atPath: filePath)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let today = Date()
        let todayString = dateFormatter.string(from: today)
        let formattedToday = dateFormatter.date(from: todayString)
        
        return dateFormatter.string(from: formattedToday!)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        collectUserData()
        guard let user = user else { return }
        save(information: user)
        toggleDisplayData()
        loadImage(image: updatePetIcon())
    }
    
    @IBAction func updateUserInfoButton(_ sender: UIButton) {
        updateUserData()
    }
}

// MARK: Save and Load user functionality

extension HomeViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("SavedData.plist")
    }
    
    func save(information: User) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(information)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error saving data")
        }
    }
    
    func load() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                user = try decoder.decode(User.self, from: data)
                pet = user?.pet
            } catch {
                print("Error decoding object")
            }
        }
    }
}
