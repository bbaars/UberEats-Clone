//
//  LoginViewController.swift
//  UberEats
//
//  Created by Brandon Baars on 12/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - Variables
    var loginSuccess: Bool = false
    
    
    // MARK: - View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginSuccess = FBSDKAccessToken.current() != nil
        
        if loginSuccess {
            FBLoginManager.getFBUserData {
                self.loginButton.setTitle("Continue with \(User.currentUser.name!)", for: .normal)
            }
        } else {
            loginButton.setTitle("Login with Facebook", for: .normal)
        }
        
        showRestaurantListing()
    }
    
    // MARK: - Custom Function
    func showRestaurantListing() {
        
        
        
        if loginSuccess {
            performSegue(withIdentifier: "toRestaurantVC", sender: nil)
        }
    }
    
    // MARK: - IBActions
    @IBAction func facebookLoginTapped() {
        
        if FBSDKAccessToken.current() != nil {
            loginSuccess = true
            showRestaurantListing()
        } else {
            
            // REQUEST LOGIN TOKEN FROM FACEBOOK
            FBLoginManager.instance.logIn(withReadPermissions: ["public_profile", "email"], from: self, handler: { (result, error) in
                if error == nil {
                    
                    let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                    
                    // LOGIN USER IN FIREBASE AS A FACEBOOK PROVIDER
                    Auth.auth().signIn(with: credential, completion: { (user, error) in
                        
                        if let error = error {
                            print("FIREBASE ERROR: ", error)
                            return
                        }
                        
                        // User is logged in, get their data
                        FBLoginManager.getFBUserData {
                            self.loginSuccess = true
                            self.showRestaurantListing()
                        }
                    })
                    
                } else {
                    print("ERROR WITH FACEBOOK LOGIN: ", error.debugDescription)
                }
            })
        }
        
    }
    
    @IBAction func facebookLogoutTapped() {
        
        
        
    }
}

