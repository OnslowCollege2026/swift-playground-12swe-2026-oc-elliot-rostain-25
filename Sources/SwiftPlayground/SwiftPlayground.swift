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

var currentEggStock = 0

func addEggs() {
        let minimumEggs = 0
        let maximumEggs = 1001
        print("Do you want to add any eggs?")
        if let input = readLine() {
            if input == "Yes" {
                print("How many Eggs do you want to add?")
                if let eggInput = readLine(), let eggNumber = Int(eggInput),
                    eggNumber > minimumEggs,
                    eggNumber < maximumEggs
                {
                    print("Added \(eggNumber) eggs to stock")
                    currentEggStock = currentEggStock + eggNumber
                    return addEggs()
                } else {
                    print("Enter a valid number of eggs (between 1-1000)")
                    return addEggs()
                }
            } else if input == "No" {
                eggMenue()
                userInput()

            } else {
                print("Please answer with Yes or No")
                return addEggs()
            }
        }


    func userInput() {

        let minimum = 0
        let maximum = 6

        if let input = readLine(), let number = Int(input), number > minimum,
            number < maximum
        {
            if number == 1 {
                addEggs()
            } else if number == 3 {
                print ("Current egg stock is of \(currentEggStock) eggs")
            }
        } else {
            print("Please choose a valid option.")
            return userInput()
        }
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
}