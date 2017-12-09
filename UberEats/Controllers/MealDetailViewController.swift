//
//  MealDetailViewController.swift
//  UberEats
//
//  Created by Brandon Baars on 12/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var quantityButtonContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        quantityButtonContainerView.layer.cornerRadius = quantityButtonContainerView.frame.height / 2
        quantityButtonContainerView.layer.borderColor = UIColor.lightGray.cgColor
        quantityButtonContainerView.layer.borderWidth = 1.0
        quantityButtonContainerView.layer.masksToBounds = true
    }

    
}
