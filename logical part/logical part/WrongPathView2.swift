import SwiftUI

struct WrongPathView2: View {
    var body: some View {
        ZStack {
            // Background color
            (Color("Background"))
.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("You have been trapped..")
                    .font(.custom("American Typewriter", size: 36))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Image("Gun")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 200)
                
                Text("..and now you are DEAD")
                    .font(.custom("American Typewriter", size: 36))
                    .foregroundColor(Color("White"))

                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    // Navigate back to the start or previous page
                    // Add your navigation code here
                }) {
                    Text("go back and try again")
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(Color("Red"))
                        .padding()
                        .background(Color("Button"))

                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

// Preview
struct WrongPathView2_Previews: PreviewProvider {
    static var previews: some View {
        WrongPathView2()
    }
}
