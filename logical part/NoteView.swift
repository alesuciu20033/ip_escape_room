import SwiftUI

struct NoteView: View {
    var body: some View {
        ZStack {
            // Background color covering the entire screen
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    // Note image
                    Image("note")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 400)
                        .padding()
                    
                    // Text displayed on top of the note image
                    Text("You are trapped on a false path. The real secrets lie behind. Retrace your steps to uncover the mystery.")
                        .font(.custom("American Typewriter", size: 19))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 90)
                        .padding(.leading, 30)
                }
                
                // navigation link to go back to the word puzzle view
                NavigationLink(destination: WordPuzzleView()) {
                    Text("Go back and try again")
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(Color("Red"))
                        .padding()
                        .background(Color("Button"))
                        .cornerRadius(8)
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

// Preview
struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
