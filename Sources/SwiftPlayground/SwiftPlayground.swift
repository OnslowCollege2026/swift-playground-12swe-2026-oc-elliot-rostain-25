// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")



print ("Enter the lengh of the room:")
    if let userInputLength = readLine(), let roomLength = Double(userInputLength) {
        print ("Enter the width of the room:  ")
    if let userInputWidth = readLine(), let roomWidth = Double(userInputWidth) {
                print ("Enter the height of the room:")
    if let userInputHeight = readLine(), let roomHeight = Double(userInputHeight) {
        let roomArea = roomLength * roomWidth
        print ("The Area of the room is \(roomArea)m²")
        print ("The height of the room is \(roomHeight)m")
        let roomVolume = roomWidth * roomLength * roomHeight
        print ("The volume ofthe room is \(roomVolume)m³")
    }
    }
        }






 
    }
}
