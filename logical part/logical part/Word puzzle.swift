import SwiftUI

struct WordPuzzleView: View {
    @State private var words = ["Dia?y", "H?use", "K?nife", "Wa?ch", "Phon?", "Sc?een", "?utton"]
    @State private var correctLetters = ["r", "a", "n", "t", "e", "r", "b"]
    @State private var currentWordIndex: Int?
    @State private var userInput: String = ""
    @State private var showKeyboard: Bool = false
    @State private var isCorrect: Bool?
    
    var body: some View {
        ZStack {
            Color(hex: "#171717").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Find the hidden word by solving this puzzle!")
                    .font(.custom("American Typewriter", size: 46))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    Divider()
                        .background(Color.white)
                        .frame(width: 2)
                    
                    VStack {
                        ForEach(words.indices, id: \.self) { index in
                            HStack {
                                formattedWord(words[index])
                                    .font(.custom("American Typewriter", size: 36)) // Set larger font size here
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        currentWordIndex = index
                                        showKeyboard = true
                                        isCorrect = nil // Reset correctness status
                                    }
                                if isCorrect == true && currentWordIndex == index {
                                    Text("✔️")
                                } else if isCorrect == false && currentWordIndex == index {
                                    Text("❌")
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    
                    Divider()
                        .background(Color.white)
                        .frame(width: 2)
                }
                
                Spacer()
                
                if showKeyboard {
                    HStack {
                        TextField("Enter letter", text: $userInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                        Button("Submit") {
                            if let index = currentWordIndex {
                                let correctLetter = correctLetters[index]
                                if userInput.lowercased() == correctLetter {
                                    var word = words[index]
                                    if let range = word.range(of: "?") {
                                        word.replaceSubrange(range, with: correctLetter.uppercased())
                                        words[index] = word
                                        isCorrect = true
                                    }
                                } else {
                                    isCorrect = false
                                }
                            }
                            userInput = ""
                            showKeyboard = false
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    func formattedWord(_ word: String) -> Text {
        let parts = word.split(separator: "?")
        var formatted = Text("")

        for (index, part) in parts.enumerated() {
            formatted = formatted + Text(String(part))
            if index < parts.count - 1 {
                formatted = formatted + Text("?").foregroundColor(Color(hex: "#8F0000"))
            }
        }

        return formatted
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

struct WordPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        WordPuzzleView()
    }
}
