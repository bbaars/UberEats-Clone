//
//  CartViewController.swift
//  UberEats
//
//  Created by Brandon Baars on 12/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - IBActions
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    // MARK: - Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        // SW Reveal View Controller
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath)
        
        return cell
    }
}
