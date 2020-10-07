//
//  TitleViewController.swift
//  WordSearchiOS
//
//  Created by Majd Khadra on 2020-09-11.
//  Copyright © 2020 majd khadra. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
        startButton.clipsToBounds = true
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 2

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

