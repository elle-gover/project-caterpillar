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
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.4, green: 0.6, blue: 0.2, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
