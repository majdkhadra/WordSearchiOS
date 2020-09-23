//
//  LetterCell.swift
//  WordSearchiOS
//
//  Created by Majd Khadra on 2020-09-05.
//  Copyright © 2020 majd khadra. All rights reserved.
//

import UIKit

class LetterCell: UICollectionViewCell {

    @IBOutlet weak var letterLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // make cells round
        self.layer.cornerRadius = 3.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        //
       // self.layer.cornerRadius = 0
       // self.clipsToBounds = true
    }

}
