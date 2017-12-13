//
//  FBLoginManager.swift
//  UberEats
//
//  Created by Brandon Baars on 12/11/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON


class FBLoginManager {
    
    
    static let instance = FBSDKLoginManager()
    
    public class func getFBUserData(completion: @escaping () -> ()) {
        
        // user has already logged in
        if FBSDKAccessToken.current() != nil {
            let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "name, email, picture.type(normal)"])!
            
            request.start(completionHandler: { (connection, result, error) in
                
                if error == nil {
                    let json = JSON(result!)
                    
                    // this grants us the users information: name, email, id, profile picture
                    print(json)
                    
                    User.currentUser.setData(withJSON: json)
                    completion()
                }
            })
        }
    }
}
