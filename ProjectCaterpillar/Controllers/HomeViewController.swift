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
    let saveData = SaveData()
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var petNameTextField: UITextField!

    @IBOutlet weak var homeScreenImage: UIImageView!
    @IBAction func addButton(_ sender: UIButton) {
        collectUserData()
        guard let user = user else { return }
        getDocumentsFolder()
        saveData.save(information: user)
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
//        print(user?.name)
//        print(pet?.stageOfLife.name)
        
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
    
    func getDocumentsFolder() {
        saveData.documentsDirectory()
        saveData.dataFilePath()
        print(saveData.dataFilePath())
    }
    
    func checkForLoadFile() -> Bool {
       let fileManager = FileManager()
       let filePath = saveData.dataFilePath().path
       
       return fileManager.fileExists(atPath: filePath)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(checkForLoadFile())

        if checkForLoadFile() {
            guard let user = user else { return }
            saveData.load(for: user)
            print(user)
            toggleDisplayData()
        } else {
            loadImage()
            nameDisplayLabel.isHidden = true
            petNameDisplayLabel.isHidden = true
        }
        
        populateLifeStage()
        
        var swallowTail = Swallowtail(name: "", startDate: "", imgFileName: "", stageOfLife: lifeStagesDatabase.lifestages[0])
        pet = swallowTail
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
