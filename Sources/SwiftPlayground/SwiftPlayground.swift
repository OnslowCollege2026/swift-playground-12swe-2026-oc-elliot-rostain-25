// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Creates a function that will print the egg shop menue.
func eggMenue() {
    print("")
    print("==== Egg Shop ====")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("Choose an option:")

}

//  Creates a variable that will store the egg stock.
// Nonisolating makes so that the program doesnt crash because of shared mutable state
nonisolated(unsafe)
    var currentEggStock = 0

// Creates a variable that will store the number of egg sold.
// Nonisolating makes so that the program doesnt crash because of shared mutable state
nonisolated(unsafe)
    var totalEggsSold = 0

/// Creates a function that caclulates the number of egg to add/
func addEggs() {

// Sets the minimum number of eggs you can add
    let minimumEggs = 0

// Sets the maximum number of eggs you can add.
    let maximumEggs = 1001

// Asks the user for input and adds requirments.
    print("How many Eggs do you want to add?")
    if let eggInput = readLine(), let eggNumber = Int(eggInput), eggNumber > minimumEggs,
        eggNumber < maximumEggs
    {
        // Adds the user input number to the egg Stock.
        print("Added \(eggNumber) eggs to stock")
        currentEggStock = currentEggStock + eggNumber

    } else {

        // If the input doesnt meet the requirments, restarts the function.
        print("Enter a valid number of eggs (between 1-1000)")
        return addEggs()
    }

}

/// Creates a function that will calculate and store the number of eggs to be sold.
func sellEggs() {
    let minimumSold = 0


// Asks the user for input to sell eggs and sets requirments.
    print("Enter how many eggs you want to sell:")
    if let sellInput = readLine(), let sellNumber = Int(sellInput), sellNumber > minimumSold,
        sellNumber < currentEggStock
    {

        // Substrack the number of eggs from the egg stock.
        // Adds the number of eggs to the total eggs sold.
        print("Sold \(sellNumber) eggs")
        currentEggStock = currentEggStock - sellNumber
        totalEggsSold = totalEggsSold + sellNumber

    } else {

        // If the input doesnt meet the requirments, sends a message and restarts the function.
        print("Enter a valid number of eggs (under the total in stock)")
        return sellEggs()
    }
}

@main
struct SwiftPlayground {
    static func main() {

// Sets the minimum number the user can input for the main menu
        let minimum = 0

// Sets the maximum number the user can input for the main menu
        let maximum = 6

// Creates a variable that will control when the while loop is active.
        var isRunning = true

// Creates a while loop to keep showing the menu until the user exits it.
        while isRunning == true {

            // Runs the eggMenu function
            eggMenue()

// Ask the user for input so it can send him to the rigth place he cose on the menu.
            if let input = readLine(), let option = Int(input), option < maximum, option > minimum {

// If the input is 1, runs the add Eggs function
                if option == 1 {
                    addEggs()
                }

// If the Input is 2, runs the sell eggs fuction
                if option == 2 {
                    sellEggs()
                }

// If the input is 3, shows the user the Egg Stock
                if option == 3 {
                    print("Current egg stock : \(currentEggStock) eggs")
                }

                // If the input is 4, shows the user the total egg sold.
                if option == 4 {
                    print(" Total eggs sold :\(totalEggsSold) eggs")
                }

// If the input is 5, exits the program
                if option == 5 {
                    isRunning = false
                }

                // If the input doesnt meet the requirments, restarts the program and shows an error message.
            } else {
                print("Enter a valid number")
            }
        }
    }
}
