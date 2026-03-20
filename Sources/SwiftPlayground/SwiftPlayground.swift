// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {

        var ocean = [
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
        ]

        let answers = [
            ["~", "~", "S", "~", "~", "~"],
            ["~", "S", "~", "~", "~", "S"],
            ["S", "~", "~", "~", "~", "S"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "S", "S", "S", "S", "~"],
            ["~", "~", "~", "~", "~", "~"],
        ]

        
// let fromRow: [Int] = [0, 1, 0, 5, 5, 5, 5, 1, 2]
// let fromCol: [Int] = [2, 1, 2, 1, 2, 3, 4, 6, 6]

// // Generate new random position
// let toRow: Int = Int.random(in: 0..<answers.count)
// let toCol: Int = Int.random(in: 0..<answers[0].count)

// //Swap the letters
// let randoShip: Int = answers[fromRow][fromCol]
// answers[fromRow][fromCol] = answers[toRow][toCol]
// answers[toRow][toCol] = randoShip

        print(board: ocean)

        while true {
            let position = positionInput(board: ocean, board2: answers)
            ocean[position[0]][position[1]] = player

            print(board: ocean)
        }

    }
}


nonisolated(unsafe)
    var player = "O"

func print(board: [[String]]) {
    board.forEach { line in
        print("\(line[0]) | \(line[1]) | \(line[2]) | \(line[3]) | \(line[4]) | \(line[5])")
        print("----------------------")
    }
    print("")
}

func positionInput(board: [[String]], board2: [[String]]) -> [Int] {
    while true {
        print("Enter a row number 1-6:")
        let userInput = readLine()!
        let rowNumber = Int(userInput)! - 1

        print("Enter a column number 1-6:")
        let guess = readLine()!
        let columnNumber = Int(guess)! - 1

        if board2[rowNumber][columnNumber] == "~" {
            player = "O"
            return [rowNumber, columnNumber]
        } else if board2[rowNumber][columnNumber] == "S" {
            player = "S"
            return [rowNumber, columnNumber]
        }
    }
}