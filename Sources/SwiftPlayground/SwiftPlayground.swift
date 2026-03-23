// The Swift Programming Language
// https://docs.swift.org/swift-book

// @main
// struct SwiftPlayground {
//     static func main() {

//         var ocean = [
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//         ]

//         let answers = [
//             ["~", "~", "S", "~", "~", "~"],
//             ["~", "S", "~", "~", "~", "S"],
//             ["S", "~", "~", "~", "~", "S"],
//             ["~", "~", "~", "~", "~", "~"],
//             ["~", "S", "S", "S", "S", "~"],
//             ["~", "~", "~", "~", "~", "~"],
//         ]

        
//         print(board: ocean)

//         while true {
//             let position = positionInput(board: ocean, board2: answers)
//             ocean[position[0]][position[1]] = player

//             print(board: ocean)
//         }

//     }
// }


// nonisolated(unsafe)
//     var player = "O"

// func print(board: [[String]]) {
//     board.forEach { line in
//         print("\(line[0]) | \(line[1]) | \(line[2]) | \(line[3]) | \(line[4]) | \(line[5])")
//         print("----------------------")
//     }
//     print("")
// }

// func positionInput(board: [[String]], board2: [[String]]) -> [Int] {
//     while true {
//         print("Enter a row number 1-6:")
//         let userInput = readLine()!
//         let rowNumber = Int(userInput)! - 1

//         print("Enter a column number 1-6:")
//         let guess = readLine()!
//         let columnNumber = Int(guess)! - 1

//         if board2[rowNumber][columnNumber] == "~" {
//             player = "O"
//             return [rowNumber, columnNumber]
//         } else if board2[rowNumber][columnNumber] == "S" {
//             player = "S"
//             return [rowNumber, columnNumber]
//         }
//     }
// }

@main
struct SwiftPlayground {
    static func main() throws {
        // The maximum number of guesses
        let maximumGuesses = 5
        
        // The size of the board 
        let size = 6
        
        // The board you play on
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)
        
        ocean[1][3] = "S"
        ocean[2][3] = "S"
        ocean[4][0] = "S"
        ocean[5][4] = "S"
        
        var progress = 1
        while progress < maximumGuesses {

            printBoard(guesses)
            

            print("\(progress): Please enter a row number, press Enter, then a column number: ")
            

            guard let userInput = readLine(),
                let row = Int(userInput),
                let userInput2 = readLine(),
                let col = Int(userInput2) else {
                print("Invalid. Try again, stupid.")
                continue
            }
            
            let oldGuesses = guesses
            
            let newGuesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)
            
            if oldGuesses != newGuesses {
                progress = progress + 1
                guesses = newGuesses
            }
            
            if remainingShips(in: ocean, guesses: guesses) == 0 {
                print("Welp , good job I guess")
                return
            } else if progress == 5{
                print("You SUCK !!! And I meant every single word I said.")
            }
        }
    }
}

func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)
    
    for (index, row) in board.enumerated() {
        var rowString = "\(index + 1) "
        for cell in row {
            rowString = rowString + cell + " "
        }
        print(rowString)
    }
}



func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
        print("Invalid. Try again you stup.")
        return guesses
    }
    
    guard guesses[row - 1][col - 1] != "O" && guesses[row - 1][col - 1] != "X" else {
        print("You have already guessed that position you absolute monke try again")
        return guesses
    }
    

    guard ocean[row - 1][col - 1] == "S" else {
        print("HAHA LOL FAILURE")
        var newGuesses = guesses
        newGuesses[row - 1][col - 1] = "O"
        return newGuesses
    }
    

    print("NO MY LIL SHIPP HOW DARE YOU SUNK IT!!!!")
    var newGuesses = guesses
    newGuesses[row - 1][col - 1] = "X"
    return newGuesses
}


func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var shipsCount = 0
    for row in 0...ocean.count-1 {
        for col in 0...row {
            if ocean[row][col] == "S" {
                shipsCount = shipsCount + 1
            }
        }
    }
    
    var hitCount = 0
    for row in 0...guesses.count-1 {
        for col in 0...row {
            if guesses[row][col] == "X" {
                hitCount = hitCount + 1
            }
        }
    }
    
    return shipsCount - hitCount
}