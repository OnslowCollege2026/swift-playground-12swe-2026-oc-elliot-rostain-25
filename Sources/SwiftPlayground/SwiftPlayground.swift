// The Swift Programming Language
// https://docs.swift.org/swift-book

@main struct SwiftPlayground {
    static func main() {

        // Current amount of kumara in the bin
        var currentStock = 0.0

        // Max kg the bin can hold
        let maxStock = 50.0

        // Price per kg of kumara
        let kgPrice = 3.00

        // Price per bag
        let bagPrice = 0.20

        // Mmax weight in a bag
        let maxBagWeight = 5.0

        // minimum weight to buy
        let minWeight = 0.1

        // number of sales (adding this everytime to the total of sales)
        let addSale = 1

        // Helps round up the number of bags i need
        let helpsMeRound = 0.999

        // Used to check if there are no sales yet
        let noSale = 0

        // THe 2d array: weight sold, bags used, total price/charge
        var sales = [[Double]]()

        let minimum = 0.0

        var running = true

        while running {

            // Main menu for the Stall/Shop
            print("")
            print("=== Kumara Shop === ")
            print("1. Add stock")
            print("2. Record a sale")
            print("3. See stock")
            print("4. See sales")
            print("5. See summary")
            print("0. Exit")
            print("Enter a number:")

            // Lets the user enter the number of their choice
            let choice = readLine()

            // if the choice is 0, exits the program
            if choice == "0" {

                print("Goodbyeeee")
                running = false

                // if the choice is 1, asks the user to add stock to the kumara bin
            } else if choice == "1" {

                // Ask the user how much stock to add to  the bin
                print("Current stock is \(currentStock) kg")
                print("How many kg do you wanna add?")

                // records the userInput to know how much they want to add
                let input = readLine()

                if let amountText = input, let amount = Double(amountText) {
                    if amount <= minimum {

                        // if the amount is under 0 or qual, then it doesnt accept
                        print("enter a valid number")
                    } else if currentStock + amount > maxStock {

                        // if the amount is over the maximum, it doesnt accept either
                        print("Cannot put more than 50 kg in the bin")
                    } else {

                        // updtaes the stock if the amount if valid
                        currentStock = currentStock + amount
                        print("Stock is now \(currentStock) kg")
                    }
                } else {
                    print("enter a valid NUMBER")
                }

            } else if choice == "2" {

                // Get the weight sold, calculate bags and charges, then save the sale
                if currentStock <= minimum {
                    print("No stock left :(")
                } else {

                    // informs the user of the current stock (maximum to be entered)
                    print("Current Stock: \(currentStock) kg")
                    print("Enter weight sold (kg):")

                    // asks for the user input to enter a weight to sell
                    let userInput = readLine()

                    if let weightString = userInput, let weight = Double(weightString) {

                        if weight < minWeight {
                            print("Minimum weight is \(minWeight) kg.")
                        } else if weight > currentStock {
                            print("Sadly, there is not enough stock...")
                        } else {

                            // Automatically calculates many bags are needed
                            // theo helpsMeRound is used to round up as Int rounds down
                            // meaning that it could give a wrong number of bags
                            // Only solution I found
                            let bags = Int((weight / maxBagWeight) + helpsMeRound)

                            // calaculates the price of the weight of kumara the user wants
                            let kumaraCharge = (weight * kgPrice)

                            // calaculates the price of the bag(s)
                            let bagCharge = Double(bags) * bagPrice

                            // adds up the 2 charges to make the total charge
                            let totalCharge = kumaraCharge + bagCharge

                            // prints a small summary of the purchase
                            print("")
                            print("Bags needed:   \(bags)")
                            print("Kumara price: $\(kumaraCharge)")
                            print("Bag price:    $\(bagCharge)")
                            print("Total charge:  $\(totalCharge)")

                            // Update stock and save the sale to the 2D array
                            currentStock = currentStock - weight
                            sales.append([weight, Double(bags), totalCharge])
                            print("Stock changed to \(currentStock) kg")
                        }

                    } else {
                        // if not a valid number, then tells the user
                        print("That was not a valid number :/")
                    }
                }

            } else if choice == "3" {

                // shows current stock to the user.
                print("Current stock: \(currentStock) kg")

            } else if choice == "4" {

                // Looks in the 2D array and print every sale
                if sales.count == noSale {
                    print("No sales yet")
                } else {
                    for saleNumber in 0..<sales.count {

                        // creates constants from the 2d array to use right after
                        let weight = sales[saleNumber][0]
                        let bags = Int(sales[saleNumber][1])
                        let total = sales[saleNumber][2]
                        print(
                            "Sale \(saleNumber + addSale): \(weight) kg, \(bags) bag(s), $\(total)")
                    }
                }

            } else if choice == "5" {

                // Add up all sales from the 2D array and show totals and averages
                if sales.count == noSale {
                    print("No sales yet")
                } else {

                    // total weight sold
                    var totalWeight = 0.0

                    // total bags used
                    var totalBags = 0.0

                    // total money earned
                    var totalEarned = 0.0

                    // For the summary, takes the values from the 2d array
                    for saleNumber in 0..<sales.count {
                        totalWeight = totalWeight + sales[saleNumber][0]
                        totalBags = totalBags + sales[saleNumber][1]
                        totalEarned = totalEarned + sales[saleNumber][2]
                    }
                    // claculates the average weight sold
                    let averageWeight = totalWeight / totalBags

                    // calculates the average money spent by buyers
                    let averageMoney = totalEarned / totalBags

                    // prints the total summary
                    print(" ===== Summary ===== ")
                    print("Total sales:       \(sales.count)")
                    print("Total weight sold: \(totalWeight) kg")
                    print("Total bags used:   \(totalBags)")
                    print("Total earned:      $\(totalEarned)")
                    print("Average kg per bag:    \(averageWeight) kg")
                    print("Average $ per bag:     $\(averageMoney)")
                }

            } else {
                print("Invalid number, try again buddy")
            }
        }
    }
}
