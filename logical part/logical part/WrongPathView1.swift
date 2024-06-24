import SwiftUI

struct WrongPathView1: View {
    var body: some View {
        ZStack {
           
            Color(hex: "#171717").edgesIgnoringSafeArea(.all)
            
            VStack {
               
                Text("Clue found!")
                    .font(.custom("American Typewriter", size: 46))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hex: "#D35E5E"))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("You unlocked the drawer\nand found a PRESENT!")
                    .font(.custom("American Typewriter", size: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Image("Drawer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .overlay(
                        Image("Present")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .offset(x: 25, y: 50),
                        alignment: .bottomTrailing
                    )
                
                Spacer()
                
                Text("Open the present and discover the present.")
                    .font(.custom("American Typewriter", size: 18))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                NavigationLink(destination: WrongPathView2()) {
                    Text("Continue")
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#D35E5E"))
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

// Preview
struct WrongPathView1_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WrongPathView1()
        }
    }
}
