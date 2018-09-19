//
//  TabBarViewController.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.3254901961, green: 0.4980392157, blue: 0.1411764706, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
