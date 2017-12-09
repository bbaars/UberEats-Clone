//
//  TrackOrderViewController.swift
//  UberEats
//
//  Created by Brandon Baars on 12/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit
import MapKit

class TrackOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var orderStatusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var resaturantLabel: UILabel!

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

extension TrackOrderViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath)
        
        return cell
    }
    
}
