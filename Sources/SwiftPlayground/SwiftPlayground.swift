// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        // Constants an variables.
        let vocabulary = [
            ["Bonjour", "Au revoir", "Merci", "Bravo"],
            ["Au revoir", "Baguette", "Merci", ""],
            ["Merci", "Au revoir", "Croissant", "Bravo"],
            ["Bravo", "Au revoir", "Restaurant", "Bonjour"],
            ["Oui", "Paris", "Bonjour", "Bravo"],
        ]

        let answers = [
            (vocabulary[0][1]), (vocabulary[1][1]), (vocabulary[2][1]), (vocabulary[3][1]),
            (vocabulary[4][1]),
        ]

        // Questions
        let questions = [
            ["How do you say Hello in French?"],
            ["How do you say Goodbye in French?"],
            ["How do you say Thank You in French?"],
            ["How do you say Congratulations in French?"],
            ["How do you say Yes in French?"],
        ]
        vocabulary.forEach { array in
            let shuffledVocab = array.shuffled()
        }
        // The indice of the question the user got wrong
        var incorrectIndices: [Int] = []

        // The number of questions the user got wrong first time around
        var incorrectCount = 0

        // Number of quesstion user got asked
        var count = 0

        var correctCount = 0

        //Loop until all vocabulary question have been asked.
        while count < vocabulary.count {
            questions.forEach { question in
                print(question)
                print("1. \(shuffledVocab[0][0])      3. \(shuffledVocab[0][2])")
                print("2. \(shuffledVocab[0][1])      4. \(shuffledVocab[0][3])")
                if let userInput = readLine() {
                    count = count + 1
                    if userInput == answers[0] {
                        correctCount = correctCount + 1
                    }
                }
            }
        }
        print("You got \(correctCount)/\(count) correct answers")

        // Present the possible answer.

        // Check if user guessed the answer correctly.
        // If not, makes note of the question to ask again later.

    }
}
