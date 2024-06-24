import SwiftUI
import AVFoundation

struct WrongPathView2: View {
    @State private var offset = CGSize.zero
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            // Background color
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Open the box..")
                    .font(.custom("American Typewriter", size: 36))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
                                // Play gunshot sound when drag ends
                                self.playGunshotSound()
                            }
                    )
                
                Text("..and see what is your present")
                    .font(.custom("American Typewriter", size: 36))
                    .foregroundColor(Color("White"))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
              //  Button(action: {
                  
            //    }) {
                   // Text("go back and try again")
                      //  .font(.custom("American Typewriter", size: 24))
                       // .foregroundColor(Color("Red"))
                      //  .padding()
                      //  .background(Color("Button"))
                      //  .cornerRadius(8)
               // }
              //  .padding()
            }
        }
        .onAppear {
            self.setupAudioPlayer()
        }
    }

    func setupAudioPlayer() {
        if let soundURL = Bundle.main.url(forResource: "openbox", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Failed to load sound: \(error)")
            }
        }
    }

    func playGunshotSound() {
        audioPlayer?.play()
    }
}

// Preview
struct WrongPathView2_Previews: PreviewProvider {
    static var previews: some View {
        WrongPathView2()
    }
}
