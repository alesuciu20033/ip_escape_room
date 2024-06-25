import SwiftUI
import CoreMotion

struct WordPuzzleView: View {
    
    @State private var words = ["Dia?y", "H?use", "K?ife", "Wa?ch", "Phon?", "Sc?een", "?utton"]
    @State private var correctLetters = ["r", "o", "n", "t", "e", "r", "b"]
    @State private var currentWordIndex: Int? = 0
    @State private var selectedLetterIndex: Int = 0
    @State private var showPicker: Bool = false
    @State private var motionManager = CMMotionManager()
    @State private var showCompletionButton: Bool = false
    @State private var showErrorView: Bool = false
    @State private var hasErrors: Bool = false
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                
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
                                    if index == currentWordIndex {
                                        formattedWord(words[index])
                                            .font(.custom("American Typewriter", size: 36))
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                showPicker = true
                                            }
                                    } else {
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
                            
                            Button("Done") {
                                applySelectedLetter()
                                moveToNextWord()
                                showPicker = false
                            }
                            .foregroundColor(.white)
                            .padding()
                        }
                    }
                    
                    if showCompletionButton {
                        Button("Complete") {
                            checkForErrors()
                            if hasErrors {
                                showErrorView = true
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Button"))
                        .cornerRadius(8)
                    }
                }
            }
            .onAppear {
                startShakeDetection()
            }
            .navigationDestination(isPresented: $showErrorView) {
                WrongPathView1()
            }
        }
    }
    
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

    func startShakeDetection() {
        guard motionManager.isAccelerometerAvailable else { return }
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let data = data else { return }
            
            let acceleration = data.acceleration
            let magnitude = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z)
            
            if magnitude > 2.5 {
                applySelectedLetter()
                moveToNextWord()
            }
        }
    }
    
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
    
    func moveToNextWord() {
        if let currentWordIndex = currentWordIndex, currentWordIndex < words.count - 1 {
            self.currentWordIndex = currentWordIndex + 1
        } else {
            self.currentWordIndex = nil
            showCompletionButton = true
        }
    }
    
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
