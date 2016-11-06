//
//  ContentViewController.swift
//  D'Andrea Visual Communications
//
//  Created by Andrew Olson on 11/5/16.
//  Copyright © 2016 Valhalla Applications. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var topString: String!
    var bottomString: String!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Content View Loaded.")
        topLabel.text = topString
        imageView.image = image
    }
}
