// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")

        // sets the while loop ready for the code to run.
        var menueRunning = true

        // sets the while loop ready for later
        var menueRunning2 = true

        // sets the while loop ready for later
        var menueRunning3 = true

        // sets the while loop ready for later
        var furnitureMenue = false

        // sets the loop ready for later
        var lastMenue = false

        // makes so that we we will be able to use this variable outside the while loops
        var roomLength = 0.0

        // makes so that we we will be able to use this variable outside the while loops
        var roomWidth = 0.0

        // makes so that we we will be able to use this variable outside the while loops
        var roomHeight = 0.0

        // sets the minium value the user can enter for the measurements (0.1).
        let minimumValue = 0.0

        // sets the maximum volume of a furniture
        let maximumVolume = 2.0

        // creates a while loop for the code to work until the user enters a valid value.
        while menueRunning == true {

            // ask the user for input and sets the requirments for the code to work.
            print("Enter room length:")
            if let input = readLine(), let length = Double(input), length > minimumValue {
                menueRunning = false
                print("The length of the room has been set to \(length)m")

                // makes so the width can be used outside the while loop.
                roomLength = roomLength + length

                // if the requirements are not met, the system informs the user, and repeats.
            } else {
                print("Enter a valid number")
            }
        }

        // creates another while loop that works until the user enters a valid value
        while menueRunning2 == true {

            // ask the user for input and sets the requirments for the code to work.
            print("Enter room width:")
            if let input = readLine(), let width = Double(input), width > minimumValue {
                menueRunning2 = false
                print("The width of the room has been set to \(width)m")

                // makes so the width can be used outside the while loop.
                roomWidth = roomWidth + width

                // if the requirements are not met, the system informs the user, and repeats.
            } else {
                print("Enter a valid number")
            }
        }

        // creates another while loop that works until the user enters a valid value
        while menueRunning3 == true {

            // ask the user for input and sets the requirments for the code to work.
            print("Enter room height:")
            if let input = readLine(), let height = Double(input), height > minimumValue {
                menueRunning3 = false
                print("The height of the room has been set to \(height)m")

                // makes so the width can be used outside the while loop.
                roomHeight = roomWidth + height

                // if the requirements are not met, the system informs the user, and repeats.
            } else {
                print("Enter a valid number")
            }
        }

        // calculates the area of the room and prints it.
        let roomArea = roomLength * roomWidth
        print("The area of the room is \(roomArea)m²")

        // calculates the volume of the room and prints it.
        let roomVolume = roomLength * roomWidth * roomHeight
        print("The volume of the room is \(roomVolume)m³")

        // sets the array for the volume of the furnitures.
        var furnitureVolumes: [Double] = []
        var furnitureNames: [String] = []

        // sets the different dialogue options
        print("Do you want to add furnitures Yes/No")
        if let userInput = readLine() {
            if userInput == "Yes" {
                furnitureMenue = true
            } else if userInput == "yes" {
                furnitureMenue = true
            } else if userInput == "YES" {
                furnitureMenue = true
            } else if userInput == "No" {
                lastMenue = true
            } else if userInput == "no" {
                lastMenue = true
            } else if userInput == "NO" {
                lastMenue = true
            }

        }
        // creates the while loop in wich we add the users furnitures
        while furnitureMenue == true {

            // asks the user the name of the furniture and adds it to the list
            print("Enter the name of your furniture:")
            if let userInput = readLine() {
                furnitureNames.append(userInput)
            }

            // asks the user for the dimensions of the furniture
            print("Enter the dimensions of your furniture (in meters)")
            print("Enter the Length of your furniture:")

            // asks the user for the length of the furniture
            if let userInput = readLine(), let length = Double(userInput), length > minimumValue {
                print("Enter the Width of your furniture:")

                // asks the user for the width of the furniture
                if let userInput = readLine(), let width = Double(userInput), width > minimumValue {
                    print("Enter the height of your furniture:")

                    // asks the user for the height of the furniture
                    if let userInput = readLine(), let height = Double(userInput),
                        height > minimumValue
                    {

                        // calculates the total volume of the furniture and adds it to the list
                        let furnitureVolume = height * width * length
                        if furnitureVolume < maximumVolume {
                            print ("Item added")
                            furnitureVolumes.append(furnitureVolume)

                            // asks the user if he wants to add a new furniture
                            print("Do you want to add another furniture?")
                            if let userInput = readLine() {
                                if userInput == "No" {
                                    furnitureMenue = false
                                        lastMenue = true
                                }
                                if userInput == "NO" {
                                    furnitureMenue = false
                                        lastMenue = true
                                }
                                if userInput == "no" {
                                    furnitureMenue = false
                                        lastMenue = true
                                }
                            } 
                        } else {
                            print(
                                "Oversized Item detected, press A if you want to continue, Q if you want to cancel"
                            )
                            if let userInput = readLine() {
                                if userInput == "A" {
                                    print ("Item added")
                                    furnitureVolumes.append(furnitureVolume)

                                    // asks the user if he wants to add a new furniture
                                    print("Do you want to add another furniture?")
                                    if let userInput = readLine() {
                                        if userInput == "No" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                        if userInput == "NO" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                        if userInput == "no" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                    } 
                                }
                                if userInput == "a" {
                                    print ("Item added")
                                    furnitureVolumes.append(furnitureVolume)

                                    // asks the user if he wants to add a new furniture
                                    print("Do you want to add another furniture?")
                                    if let userInput = readLine() {
                                        if userInput == "No" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                        if userInput == "NO" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                        if userInput == "no" {
                                            furnitureMenue = false
                                        lastMenue = true
                                        }
                                    } 
                                }
                            }
                        }

                        // if the requirements are not met, the system informs the user, and repeats
                    } else {
                        print("Enter a valid number")
                    }

                    // if the requirements are not met, the system informs the user, and repeats.
                } else {
                    print("Enter a valid number")
                }

                // if the requirements are not met, the system informs the user, and repeats.
            } else {
                print("Enter a valid number")
            }
        }

        while lastMenue == true {
            print("|     RECAP     |")
            print("Room Area : \(roomArea)m²")
            print("Room Volume : \(roomVolume)m³")
            print("Furnitures:")
            furnitureNames.forEach { name in
print ("\(name) : \(furnitureVolumes.forEach)")
            }
            lastMenue = false
        }

    }
}
