import SwiftUI
import CoreMotion

struct WordPuzzleView: View {
    
    // State variables to manage the words, correct letters, and current word index
    @State private var words = ["Dia?y", "H?use", "K?ife", "Wa?ch", "Phon?", "Sc?een", "?utton"]
    @State private var correctLetters = ["r", "o", "n", "t", "e", "r", "b"]
    @State private var currentWordIndex: Int? = 0
    @State private var selectedLetterIndex: Int = 0
    @State private var showPicker: Bool = false
    @State private var motionManager = CMMotionManager()
    
    // The alphabet letters from where the player can choose
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
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
                        // The player can go through each word in the list until he finds the one that he thinks is correct
                        ForEach(words.indices, id: \.self) { index in
                            HStack {
                                // If the word is the current word being solved
                                if index == currentWordIndex {
                                    formattedWord(words[index])
                                        .font(.custom("American Typewriter", size: 36))
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            showPicker = true
                                        }
                                } else {
                                    // If the word is not the current word being solved
                                    formattedWord(words[index])
                                        .font(.custom("American Typewriter", size: 36))
                                        .foregroundColor(.white)
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
                
                // Show the picker if showPicker is true
                if showPicker {
                    VStack {
                        Picker("Select Letter", selection: $selectedLetterIndex) {
                            ForEach(0..<alphabet.count, id: \.self) { index in
                                Text(String(alphabet[index]))
                                    .foregroundColor(.black)
                                    .font(.custom("American Typewriter", size: 24))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .background(Color.white)
                        .frame(height: 150)
                        .clipped()
                        .border(Color.white, width: 2)
                        .padding()
                        
                        // Button to confirm letter selection
                        Button("Done") {
                            applySelectedLetter()
                            moveToNextWord()
                            showPicker = false
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            startShakeDetection()
        }
    }
    
    // Function to format the word by highlighting the placeholder character in red
    func formattedWord(_ word: String) -> Text {
        var formatted = Text("")
        
        // Loop through each character in the word
        for char in word {
            if char == "?" {
                //
                formatted = formatted + Text(String(char)).foregroundColor(Color(hex: "#D35E5E"))
            } else {
                // Otherwise, keep the character as is
                formatted = formatted + Text(String(char))
            }
        }
        
        return formatted
    }

    // Start accelerometer to detect shake gesture
    func startShakeDetection() {
        guard motionManager.isAccelerometerAvailable else { return }
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let data = data else { return }
            
            let acceleration = data.acceleration
            let magnitude = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z)
            
            // If shake is detected
            if magnitude > 2.5 {
                applySelectedLetter()
                moveToNextWord()
            }
        }
    }
    
    // This function applies the letter that was selected by the player to the current word
    func applySelectedLetter() {
        if let index = currentWordIndex {
            let correctLetter = String(alphabet[selectedLetterIndex])
            var word = words[index]
            if let range = word.range(of: "?") {
                word.replaceSubrange(range, with: correctLetter.uppercased())
                words[index] = word
            }
        }
    }
    
    // Move to the next word in the list
    func moveToNextWord() {
        if let currentWordIndex = currentWordIndex, currentWordIndex < words.count - 1 {
            self.currentWordIndex = currentWordIndex + 1
        } else {
            self.currentWordIndex = 0
        }
    }
}

// Extension to create a color from a hex string
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

// Preview
struct WordPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        WordPuzzleView()
    }
}
