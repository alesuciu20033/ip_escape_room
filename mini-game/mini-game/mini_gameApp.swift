import SwiftUI

@main
struct MiniGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ClueFoundView()
    }
}

struct ClueFoundView: View {
    @State private var showHappyFace = false
    
    var body: some View {
        VStack(spacing: 20) {
            if showHappyFace {
                HappyFaceView()
            } else {
                VStack(spacing: 20) {
                    Text("Clue found!")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.red)
                        .padding(.top, 40)
                    
                    Text("You unlocked the drawer and found a")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("BUTTON!")
                        .font(.title2)
                        .foregroundColor(.red)
                    
                    VStack(spacing: 2) {
                        ForEach(0..<2) { _ in
                            Rectangle()
                                .frame(height: 60)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                        ZStack {
                            Rectangle()
                                .frame(height: 70)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            VStack {
                                Spacer()
                                LockIcon()
                                    .frame(width: 40, height: 50)
                                    .padding(.bottom, 15)
                            }
                        }
                    }
                    .frame(width: 140)
                    .padding(.vertical, 50)
                    
                    Text("It seems that this button is from")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text("Alex's jacket!")
                        .font(.title3)
                        .foregroundColor(.red)
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    Button(action: {
                        showHappyFace = true
                    }) {
                        Text("Continue")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.edgesIgnoringSafeArea(.all))
            }
        }
        .animation(.easeInOut, value: showHappyFace)
    }
}

struct LockIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                )
            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(.yellow)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 2)
                )
                .offset(y: 15)
            Path { path in
                path.move(to: CGPoint(x: 20, y: 12))
                path.addArc(center: CGPoint(x: 20, y: 12), radius: 10, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
            }
            .stroke(Color.black, lineWidth: 2)
            .offset(y: -10)
        }
    }
}

struct HappyFaceView: View {
    var body: some View {
        VStack {
            Spacer()
            SmileyFace()
                .frame(width: 100, height: 100)
            Spacer()
            Text("You win!")
                .font(.largeTitle)
                .foregroundColor(.yellow)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct SmileyFace: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
            VStack {
                HStack(spacing: 20) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 10, height: 10)
                }
                .padding(.bottom, 10)
                Path { path in
                    path.move(to: CGPoint(x: 15, y: 25))
                    path.addQuadCurve(to: CGPoint(x: 35, y: 25), control: CGPoint(x: 25, y: 35))
                }
                .stroke(Color.black, lineWidth: 2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
