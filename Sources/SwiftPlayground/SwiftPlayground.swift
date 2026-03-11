// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Creates a function that will print the egg shop menue.
func menuChoice() -> Int {
    while true {

        print(
            """
            ==== Egg Shop ====
            1. Add eggs
            2. Sell eggs
            3. Show current stock
            4. Show total eggs sold
            5. Reset egg shop
            6. Exit
            Choose an option:
            """)
    }
    if let userInput = readLine(),
        let choice =
            Int(userInput)
    {
        return choice
    }

}

func addEggs(currentStock: Int, amount: Int) -> Int {
    let newStock = currentStock + amount

    print("Added \(amount) to the stock")
    print("You have now \(newStock) eggs")

    return newStock
}

@main
struct SwiftPlayground {
    static func main() {

        var eggsInStcok = 0
        var eggsSold = 0

        while true {
            let choice = menuChoice()
            
            if choice == 1 {
                if let userInput = readLine(), if let amount = Int(userInput), amount > 0 {
                
                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsSold) 
                }
            }
        }

    }
}
