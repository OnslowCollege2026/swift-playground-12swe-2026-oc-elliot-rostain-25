// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        // Constants an variables.
        let vocabulary: [[String]] = [
            ["Hello", "Bonjour", "Au revoir", "Merci"],
            ["Goodbye", "Au revoir", "Baguette", "Merci"],
            ["Thank You", "Merci", "Croissant", "Oui Oui"],
            ["Congratulations", "Bravo", "Au revoir", "Restaurant"],
            ["Yes", "Oui", "Paris", "Bonjour"],
        ]

        // Number of quesstion user got asked
        var counter = 0

        var score = 0

        // The indice of the question the user got wrong
        var incorrectIndices: [Int] = []

        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let allAnswers = vocabulary[counter].dropFirst().shuffled()

print("What is the translation for \(englishWord) in French")
allAnswers.forEach { answer in
print(" * \(answer)")
}
if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
    score = score + 1 
    print("\(correctWord) is correct !!!")

} else {
    incorrectIndices.append(counter)
    print("Wrong, \(correctWord) was the correct answer.")
        }
        counter = counter + 1
    }
    while incorrectIndices.count > 0 {
        let index = incorrectIndices[0]
        
        let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()

print("What is the translation for \(englishWord) in French")
allAnswers.forEach { answer in
print(" * \(answer)")
}
if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
    incorrectIndices.removeFirst()
    print("\(correctWord) is correct !!!")

} else {
    print("Wrong, \(correctWord) was the correct answer.")
        }
    }
            print("Your total score was \(score)/\(vocabulary.count) ")

}
}