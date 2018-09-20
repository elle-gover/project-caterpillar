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
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var petNameTextField: UITextField!

    @IBOutlet weak var homeScreenImage: UIImageView!
        
    @IBAction func addButton(_ sender: UIButton) {
        collectUserData()
        guard let user = user else { return }
        save(information: user)
        toggleDisplayData()
    }
    
    
    @IBOutlet weak var petNameLabel: UILabel!
    
    @IBOutlet weak var nameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePicker: UIPickerView!
    @IBOutlet weak var petNameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePickerDisplayLabel: UILabel!
    
    func loadImage() {
        homeScreenImage.image = UIImage(named: "Butterfly")
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
        petNameTextField.isHidden = true
        nameDisplayLabel.isHidden = false
        petNameDisplayLabel.isHidden = false
        petNameLabel.isHidden = true
        lifeStagePickerDisplayLabel.isHidden = true
        nameDisplayLabel.text = user?.name
        petNameDisplayLabel.text = pet?.name
        addButtonOutlet.isHidden = true

    }
    
    func checkForLoadFile() -> Bool {
       let fileManager = FileManager()
       let filePath = dataFilePath().path
       
       return fileManager.fileExists(atPath: filePath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let checkForFile = checkForLoadFile()
        populateLifeStage()
        
        if checkForFile {
            //MARK: TODO: From saveData.load, user is nil
            load()
            toggleDisplayData()
        } else {
            loadImage()
            nameDisplayLabel.isHidden = true
            petNameDisplayLabel.isHidden = true
            var swallowTail = Swallowtail(name: "", startDate: "", imgFileName: "", stageOfLife: lifeStagesDatabase.lifestages[0])
            pet = swallowTail
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

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
