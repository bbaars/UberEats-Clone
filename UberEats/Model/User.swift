//
//  User.swift
//  UberEats
//
//  Created by Brandon Baars on 12/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var name: String?
    var email: String?
    var pictureURL: String?
    var id: String?
    
    // Singleton
    static let currentUser = User()
    
    func setData(withJSON json: JSON) {
        name = json["name"].string
        email = json["email"].string
        id = json["id"].string
        
        let imageDictionary = json["picture"].dictionary
        let imageDataDict = imageDictionary?["data"]?.dictionary
        pictureURL = imageDataDict?["url"]?.string
        
    }
}
