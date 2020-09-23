import UIKit

class gameBrain {
    var wordNums = [0, 10, 20, 30, 99, 89, 79, 69, 59, 49, 39, 29, 19, 9, 90, 81, 72, 63, 54, 12, 13, 14, 15, 16, 17, 97, 87, 77, 67, 57, 47, 38, 37, 36, 35, 34, 33, 32, 31]
    var word = ""
    let wordsToFindArray = ["JAVA", "OBJECTIVEC", "SWIFT", "KOTLIN","MOBILE", "VARIABLE"]
    var wordsAsCharacters = ["J", "A", "V", "A", "O", "B", "J", "E", "C", "T", "I", "V", "E", "C", "S", "W", "I", "F", "T", "K", "O", "T", "L", "I", "N", "M", "O", "B", "I", "L", "E", "V", "A", "R", "I", "A", "B", "L", "E"]
    let alphabetArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    let reuseIdentifier = "Letter Cell"

    let spaceBetweenCellsInARow: CGFloat = 9
}
