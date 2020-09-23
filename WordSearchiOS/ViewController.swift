//
//  ViewController.swift
//  WordSearchiOS
//
//  Created by Majd Khadra on 2020-09-04.
//  Copyright © 2020 majd khadra. All rights reserved.
//

import UIKit

var currentSelection: Int? = nil
var wordNums = [0, 10, 20, 30, 99, 89, 79, 69, 59, 49, 39, 29, 19, 9, 90, 81, 72, 63, 54, 12, 13, 14, 15, 16, 17, 97, 87, 77, 67, 57, 47, 38, 37, 36, 35, 34, 33, 32, 31 ]
var word = ""
let wordsToFindArray = ["JAVA", "OBJECTIVEC", "SWIFT", "KOTLIN","MOBILE", "VARIABLE"]
var wordsAsCharacters = Array(wordsToFindArray.joined())
let alphabetArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var selectedCells: [IndexPath] = []

let reuseIdentifier = "Letter Cell"

let spaceBetweenCellsInARow: CGFloat = 9

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var checkWordButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var wordCount: UILabel!
    
    @IBOutlet weak var javaLabel: UILabel!
    @IBOutlet weak var swiftLabel: UILabel!
    @IBOutlet weak var objLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var variableLabel: UILabel!
    @IBOutlet weak var kotlinLabel: UILabel!
    
    @IBAction func checkWordButton(_ sender: UIButton) {
        if wordsToFindArray.contains(word) {
            wordCount.text = String(Int(wordCount.text!)! + 1)
            for element in selectedCells {
                collectionView.cellForItem(at: element)!.backgroundColor = .green
                javaLabel.textColor = .green
            }
            switch word {
            case "JAVA":
                javaLabel.textColor = .green
            case "SWIFT":
                swiftLabel.textColor = .green
            case "MOBILE":
                mobileLabel.textColor = .green
            case "OBJECTIVEC":
                objLabel.textColor = .green
            case "KOTLIN":
                kotlinLabel.textColor = .green
            case "VARIABLE":
                variableLabel.textColor = .green
            default:
                return
            }
        }
        else {
            for element in selectedCells {
                collectionView.cellForItem(at: element)!.backgroundColor = .white

            }
            
            
        }
        if wordCount.text == "6" {
            let restartGameAction = UIAlertAction(title: "Play Again", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            let alertController = UIAlertController(title: "You Win!", message:
                "You found all the words!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Great!", style: .default))
            alertController.addAction(restartGameAction)
            

            self.present(alertController, animated: true, completion: nil)
        }
        selectedCells = []
        word = ""
        currentSelection = nil
    }
    
    
    
    // Number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // Creating the Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LetterCell
        
        // Puts wordsToFind in their Cells
        if wordNums.contains(indexPath.row) {
            let index: Int = wordNums.firstIndex(of: indexPath.row)! //
            cell.letterLabel.text = String(wordsAsCharacters[index])
        }
            // Fills other cells with random letters
        else {
            cell.letterLabel.text = alphabetArray.randomElement()
        }
        cell.backgroundColor = .white
        
        return cell
    }
    // Checks if selection is valid (vertical/horizontal/diagonal)
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if currentSelection == nil {
            return true
        }
            //else if (indexPath.row < 10) && (currentSelection! / 10) == (indexPath.row / 10) &&
        else if (currentSelection! / 10) == (indexPath.row / 10) && abs((currentSelection! % 10) - (indexPath.row % 10)) == 1 {
            return true
        }
        else if abs((currentSelection! / 10) - (indexPath.row / 10)) == 1 && (currentSelection! % 10) == (indexPath.row % 10) {
            return true
        }
        else if abs((currentSelection! / 10) - (indexPath.row / 10)) == 1 && abs((currentSelection! % 10) - (indexPath.row % 10)) == 1 {
            return true
        }
        else {
            return false
        }
    }
    // Cell selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LetterCell
        currentSelection = indexPath.row
        cell.backgroundColor = .red
        print("\"\(indexPath.row)\",")
        
        //print(wordsAsCharacters)
        word.append(cell.letterLabel.text!)
        selectedCells.append(indexPath)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - spaceBetweenCellsInARow) / 10
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        checkWordButton.layer.cornerRadius = 15
        checkWordButton.layer.borderWidth = 1
        checkWordButton.layer.borderColor = UIColor.black.cgColor
        checkWordButton.clipsToBounds = true
        
    }
}

