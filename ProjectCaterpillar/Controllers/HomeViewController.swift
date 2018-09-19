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
        toggleDisplayData()
    }
    
    @IBOutlet weak var nameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePicker: UIPickerView!
    @IBOutlet weak var petNameDisplayLabel: UILabel!
    @IBOutlet weak var lifeStagePickerDisplayLabel: UILabel!
    
    
    func loadImage() {
        homeScreenImage.image = UIImage(named: "Butterfly")
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
        petNameDisplayLabel.isHidden = true
        lifeStagePickerDisplayLabel.isHidden = true
        nameDisplayLabel.text = user?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        populateLifeStage()
        nameDisplayLabel.isHidden = true
        
        var swallowTail = Swallowtail(name: "", startDate: "", imgFileName: "", stageOfLife: lifeStagesDatabase.lifestages[0])
        pet = swallowTail
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
