import SwiftUI

struct NoteView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    Image("note")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 400)
                        .padding()
                    
                    Text("You are trapped on a false path. The real secrets lie behind. Retrace your steps to uncover the mystery.")
                        .font(.custom("American Typewriter", size: 19))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 90)
                        .padding(.leading, 30) 
                }
                
                NavigationLink(destination: WordPuzzleView()) {
                    Text("go back and try again")
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(.red)
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
