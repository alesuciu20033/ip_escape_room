import SwiftUI
import AVFoundation
import Lottie

// Shows a Lottie animation in SwiftUI
struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce

    let animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        // Set up the Lottie animation
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        view.addSubview(animationView)
        
        // Makke the animation fill the view
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }

    // No need to update the view
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}

struct WrongPathView2: View {
    @State private var offset = CGSize.zero
    @State private var audioPlayer: AVAudioPlayer?
    @State private var showEffect = false
    @State private var navigateToNote = false
    private let audioHelper = AudioPlayerHelper()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Prompt to open the box
                    Text("Open the box..")
                        .font(.custom("American Typewriter", size: 36))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // Present image with drag gesture
                    Image("present2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 200)
                        .offset(offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    self.offset = gesture.translation
                                }
                                .onEnded { _ in
                                    self.playBoxOpeningSound()
                                }
                        )
                    
                    // Prompt to see the clue
                    Text("..and see what clue you received")
                        .font(.custom("American Typewriter", size: 36))
                        .foregroundColor(Color("White"))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    // Show animation if needed
                    if showEffect {
                        LottieView(name: "magic", loopMode: .playOnce)
                            .frame(width: 200, height: 200)
                            .transition(.opacity)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        self.navigateToNote = true
                                    }
                                }
                            }
                    }
                }
            }
            .onAppear {
                self.setupAudioPlayer()
            }
            .navigationDestination(isPresented: $navigateToNote) {
                NoteView()
            }
        }
    }

    // Set up the audio player
    func setupAudioPlayer() {
        if let soundURL = Bundle.main.url(forResource: "openbox2", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.delegate = audioHelper
                audioPlayer?.prepareToPlay()
                // Show effect when sound finishes
                audioHelper.didFinishPlaying = {
                    withAnimation {
                        self.showEffect = true
                    }
                }
            } catch {
                print("Failed to load sound: \(error)")
            }
        }
    }

    // Play the box opening sound
    func playBoxOpeningSound() {
        audioPlayer?.play()
    }
}

// Helper class for audio events
class AudioPlayerHelper: NSObject, AVAudioPlayerDelegate {
    var didFinishPlaying: (() -> Void)?

    // Called when audio finishes playing
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        didFinishPlaying?()
    }
}

// Preview
struct WrongPathView2_Previews: PreviewProvider {
    static var previews: some View {
        WrongPathView2()
    }
}
