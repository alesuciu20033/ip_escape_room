import SwiftUI
import CoreMotion

struct WordPuzzleView: View {
    
    // State variables for managing the words, correct letters, and other UI elements
    @State private var words = ["Dia?y", "H?use", "K?ife", "Wa?ch", "Phon?", "Sc?een", "?utton"]
    @State private var correctLetters = ["r", "o", "n", "t", "e", "r", "b"]
    @State private var currentWordIndex: Int? = 0
    @State private var selectedLetterIndex: Int = 0
    @State private var showPicker: Bool = false
    @State private var motionManager = CMMotionManager()
    @State private var showCompletionButton: Bool = false
    @State private var showErrorView: Bool = false
    @State private var hasErrors: Bool = false
    
    // The alphabet letters that the player can choose from
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color("Background").edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Find the hidden word by solving this puzzle!")
                        .font(.custom("American Typewriter", size: 34))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack {
                        
                        Divider()
                            .background(Color.white)
                            .frame(width: 2)
                        
                        VStack {
                            // Loop through each word and display it
                            ForEach(words.indices, id: \.self) { index in
                                HStack {
                                    if index == currentWordIndex {
                                        // If the word is the current one, make it tappable to show the picker
                                        formattedWord(words[index])
                                            .font(.custom("American Typewriter", size: 30))
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                showPicker = true
                                            }
                                    } else {
                                        // Display the word normally
                                        formattedWord(words[index])
                                            .font(.custom("American Typewriter", size: 30))
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        
                        
                        Divider()
                            .background(Color.white)
                            .frame(width: 2)
                    }
                    
                    Spacer()
                    
                    // Show the letter picker if showPicker is true
                    if showPicker {
                        VStack {
                            Picker("Select Letter", selection: $selectedLetterIndex) {
                                ForEach(0..<alphabet.count, id: \.self) { index in
                                    Text(String(alphabet[index]))
                                        .foregroundColor(.black)
                                        .font(.custom("American Typewriter", size: 20))
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .background(Color.white)
                            .frame(height: 150)
                            .clipped()
                            .border(Color.white, width: 2)
                            .padding()
                        }
                    }
                    
                    // Show the 'complete' button if all words are processed
                    if showCompletionButton {
                        Button("Complete") {
                            checkForErrors()
                            if hasErrors {
                                showErrorView = true
                            }
                        }
                        .foregroundColor(Color("Red"))
                        .font(.custom("American Typewriter", size: 24))
                        .padding()
                        .background(Color("Button"))
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                    }
                }
                .padding()
            }
            .onAppear {
                startShakeDetection()
            }
            .navigationDestination(isPresented: $showErrorView) {
                WrongPathView1()
            }
        }
    }
    
    // Function to format the word by highlighting the placeholder character in red
    func formattedWord(_ word: String) -> Text {
        var formatted = Text("")
        for char in word {
            if char == "?" {
                formatted = formatted + Text(String(char)).foregroundColor(Color("Red"))
            } else {
                formatted = formatted + Text(String(char))
            }
        }
        return formatted
    }

    // Start accelerometer updates to detect shaking
    func startShakeDetection() {
        guard motionManager.isAccelerometerAvailable else { return }
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let data = data else { return }
            
            let acceleration = data.acceleration
            let magnitude = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z)
            
            // If a shake is detected, apply the selected letter and move to the next word
            if magnitude > 2.5 {
                applySelectedLetter()
                moveToNextWord()
            }
        }
    }
    
    // Apply the selected letter to the current word
    func applySelectedLetter() {
        if let index = currentWordIndex {
            let selectedLetter = String(alphabet[selectedLetterIndex])
            var word = words[index]
            if let range = word.range(of: "?") {
                word.replaceSubrange(range, with: selectedLetter.uppercased())
                words[index] = word
            }
        }
    }
    
    // move to the next word in the list or show the completion button if all words are done
    func moveToNextWord() {
        if let currentWordIndex = currentWordIndex, currentWordIndex < words.count - 1 {
            self.currentWordIndex = currentWordIndex + 1
        } else {
            self.currentWordIndex = nil
            showPicker = false
            showCompletionButton = true
        }
    }
    
    // check for errors in the completed words
    func checkForErrors() {
        hasErrors = false
        for (index, word) in words.enumerated() {
            let correctLetter = correctLetters[index]
            if let range = word.range(of: "?") {
                hasErrors = true
                break
            }
            if !word.lowercased().contains(correctLetter) {
                hasErrors = true
                break
            }
        }
    }
}

// Preview 
struct WordPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        WordPuzzleView()
    }
}
