// The Swift Programming Language
// https://docs.swift.org/swift-book

func eggMenue() {


    print("==== Egg Shop ====")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("Choose an option:")

    

func userInput() {

    let minimum = 0
    let maximum = 6

    guard let input = readLine(), let number = Int(input), number > minimum,
        number < maximum
    else {
        print("Please choose a valid option.")
        return userInput()
    }
}

func addEggs(currentStock: Int, amount: Int) -> Int {
    var currentStock = 0
    print ("Do you want to add eggs?")
    print (" Current stock : \(currentStock)")
}


    @main
    struct SwiftPlayground {
        static func main() {

            var menuRunning = true

            while menuRunning == true {
                eggMenue()
                userInput()
                menuRunning = false

            }
        }

    }
}
