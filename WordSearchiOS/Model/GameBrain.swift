import UIKit

class GameBrain {
    var score = 0
    
    var word = ""
    
    let wordsToFindArray = ["JAVA", "OBJECTIVEC", "SWIFT", "KOTLIN","MOBILE", "VARIABLE"]
    
    // MARK: - Functions
    
    // returns true if word is in wordsToFindArray
    func checkAnswer(_ word: String) -> Bool {
        if wordsToFindArray.contains(word) {
           score += 1
            return true
        } else {
            return false
        }
    }
    
    // Changes label text color to green
    func labelToGreen(_ label: UILabel) {
        label.textColor = .green
    }

    // Changes background color of selected cells to green
    func cellsToGreen(_ collectionView: UICollectionView) {
        for element in selectedCells {
            collectionView.cellForItem(at: element)!.backgroundColor = .green
        }
    }
    
    // Changes background color of selected cells to white
    func cellsToWhite(_ collectionView: UICollectionView) {
        for element in selectedCells {
            collectionView.cellForItem(at: element)!.backgroundColor = .white

        }
    }
    
    // Sends an alert for end of game
    func endGameAlert(_ viewController: UIViewController) {
        let restartGameAction = UIAlertAction(title: "Play Again", style: .default) { (action) in
            viewController.dismiss(animated: true, completion: nil)
        }
        let alertController = UIAlertController(title: "You Win!", message:
            "You found all the words!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Great!", style: .default))
        alertController.addAction(restartGameAction)
        

        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // reset the selected cells and the word
    func resetCells () {
        selectedCells = []
        word = ""
        currentSelection = nil
    }
    
}

// MARK: - UI Initilization Functions

extension GameBrain {
    
    func collectionViewDimensions(_ collectionView: UICollectionView, _ viewController: UIViewController) {
        let width = (viewController.view.frame.size.width - spaceBetweenCellsInARow) / 10
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)

        }
    
    func buttonCustomized(_ button: UIButton) {
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.clipsToBounds = true
    }
}
