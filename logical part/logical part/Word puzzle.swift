import SwiftUI
import CoreMotion

struct WordPuzzleView: View {
    @State private var words = ["Dia?y", "H?use", "K?nife", "Wa?ch", "Phon?", "Sc?een", "?utton"]
    @State private var correctLetters = ["r", "a", "n", "t", "e", "r", "b"]
    @State private var currentWordIndex: Int? = 0
    @State private var selectedLetterIndex: Int = 0
    @State private var showPicker: Bool = false
    @State private var motionManager = CMMotionManager()
    
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
            }
        }
        .onAppear {
            startShakeDetection()
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
            let correctLetter = String(alphabet[selectedLetterIndex])
            var word = words[index]
            if let range = word.range(of: "?") {
                word.replaceSubrange(range, with: correctLetter.uppercased())
                words[index] = word
            }
        }
    }
    
    func moveToNextWord() {
        if let currentWordIndex = currentWordIndex, currentWordIndex < words.count - 1 {
            self.currentWordIndex = currentWordIndex + 1
        } else {
            self.currentWordIndex = 0
        }
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
