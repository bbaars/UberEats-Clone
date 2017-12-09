//
//  ViewController.swift
//  UberEats
//
//  Created by Brandon Baars on 12/8/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class RestaurantListingTableViewController: UITableViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}

