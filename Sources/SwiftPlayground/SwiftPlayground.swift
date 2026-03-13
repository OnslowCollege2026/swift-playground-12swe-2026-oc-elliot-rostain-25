// The Swift Programming Language
// https://docs.swift.org/swift-book

func printBoard(_ board: [[String]]) {

}

@main
struct SwiftPlayground {
    static func main() {

        var player = "S"
        var ocean = [
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "~", "~", "~", "~", "~"],
        ]

        var answers = [
            ["~", "~", "S", "~", "~", "~"],
            ["~", "S", "~", "~", "~", "S"],
            ["S", "~", "~", "~", "~", "S"],
            ["~", "~", "~", "~", "~", "~"],
            ["~", "S", "S", "S", "S", "~"],
            ["~", "~", "~", "~", "~", "~"],
        ]
        print(board: ocean)

        while true {
            let position = positionInput(board: ocean)
            ocean[position[0]][position[1]] = player

            if player == "S" {
                player = "O"
            } else {
                player = "O"
            }

            print(board: ocean)
        }

    }
}

func print(board: [[String]]) {
    board.forEach { line in
        print("\(line[0]) | \(line[1]) | \(line[2]) | \(line[3]) | \(line[4]) | \(line[5])")
        print("----------------------")
    }
    print("")
}

func positionInput(board: [[String]]) -> [Int] {
    while true {
        print("Enter a row number 1-6:")
        let userInput = readLine()!
        let rowNumber = Int(userInput)! - 1

        print("Enter a column number 1-6:")
        let userInput2 = readLine()!
        let columnNumber = Int(userInput2)! - 1

        if board[rowNumber][columnNumber] == "~" {
            return [rowNumber, columnNumber]
        } else if board[rowNumber][columnNumber] == "" {
            return [rowNumber, columnNumber]
        }
    }
}