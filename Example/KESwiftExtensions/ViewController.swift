//
//  ViewController.swift
//  KESwiftExtensions
//
//  Created by Kais Ebraheem on 06/12/2020.
//  Copyright (c) 2020 Kais Ebraheem. All rights reserved.
//

import UIKit

// Step 1: import KESwiftExtensions modules
import KESwiftExtensions

class ViewController: UIViewController {

    // Step 2: Declare or connect an image view. Be sure to set the image width/height constraints
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Step 3: Call the roundViewWith: method on your image view
        testImageView.roundViewWith(borderColor: UIColor.white, borderWidth: 5.0)
    }

}

