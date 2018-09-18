//
//  HomeViewController.swift
//  ProjectCaterpillar
//
//  Created by Elle Gover on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var user: User?
    
    
    let lifeStages = ["Egg", "Caterpillar", "Butterfly"]

    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var petNameTextField: UITextField!
    
    @IBOutlet weak var homeScreenImage: UIImageView!
    
    @IBAction func addButton(_ sender: UIButton) {
       collectUserData()
    }
    
    @IBOutlet weak var lifeStagePicker: UIPickerView!
    
    func loadImage() {
        homeScreenImage.image = UIImage(named: "Butterfly")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifeStages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifeStages.count
    }
   
    
    func collectUserData()  {
        let newUserName = userNameTextField.text!
        let newPetName = petNameTextField.text!
//        user = User(name: newUserName, pet: newPetName)
//        let swallowtail = Swallowtail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
