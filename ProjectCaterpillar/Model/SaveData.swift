//
//  SaveData.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/19/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class SaveData {
    
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
    
    func load(for user: User) {
        var user = user
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                user = try decoder.decode(User.self, from: data)
            } catch {
                print("Error decoding object array")
            }
        }
    }
    
}
