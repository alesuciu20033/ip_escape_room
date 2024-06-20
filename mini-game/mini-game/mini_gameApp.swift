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
        NavigationView {
            ClosedDrawerView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ClosedDrawerView: View {
    @State private var animateLock = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .opacity(animateLock ? 1 : 0)
                .scaleEffect(animateLock ? 1 : 0.5)
                .rotationEffect(animateLock ? .degrees(0) : .degrees(-180))
                .animation(.easeInOut(duration: 1), value: animateLock)
                .padding(.top, 40)

            Text("Unlock the ")
                .font(.title)
                .foregroundColor(.red)
                .opacity(animateLock ? 1 : 0)
                .offset(y: animateLock ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.2), value: animateLock)
            Text("drawer")
                .font(.title)
                .foregroundColor(.red)
                .opacity(animateLock ? 1 : 0)
                .offset(y: animateLock ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.4), value: animateLock)
            Text(" and see what's inside!")
                .font(.title)
                .foregroundColor(.red)
                .opacity(animateLock ? 1 : 0)
                .offset(y: animateLock ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.6), value: animateLock)
            
            VStack(spacing: 2) {
                ForEach(0..<3) { _ in
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
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    VStack {
                        Spacer()
                        NavigationLink(destination: OpenDrawerView()) {
                            LockIcon()
                                .frame(width: 40, height: 50)
                                .padding(.bottom, 10)
                                .scaleEffect(animateLock ? 1 : 0.5)
                                .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5), value: animateLock)
                        }
                    }
                }
            }
            .frame(width: 150)
            .padding(.vertical, 50)
            
            Text("Tip: Press on the lock and solve the puzzle to open the drawer.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .opacity(animateLock ? 1 : 0)
                .offset(y: animateLock ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.8), value: animateLock)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                animateLock = true
            }
        }
    }
}

struct LockIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 24, height: 24)
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
                path.move(to: CGPoint(x: 12, y: 12))
                path.addArc(center: CGPoint(x: 12, y: 12), radius: 10, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
            }
            .stroke(Color.black, lineWidth: 2)
            .offset(y: -10)
        }
        .transition(.scale)
    }
}

struct OpenDrawerView: View {
    @State private var showSmileyFace = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Drawer is now open!")
                .font(.largeTitle)
                .foregroundColor(.red)
                .bold()
                .padding(.top, 40)
            Text("Clue found!")
                .font(.largeTitle)
                .foregroundColor(.red)
                .bold()
                .padding(.top, 40)
                .opacity(showSmileyFace ? 1 : 0)
                .offset(y: showSmileyFace ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.2), value: showSmileyFace)
            
            VStack(spacing: 2) {
                ForEach(0..<3) { _ in
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
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    VStack {
                        Spacer()
                        if showSmileyFace {
                            SmileyFace()
                                .frame(width: 50, height: 50)
                                .transition(.scale)
                                .padding(.bottom, 10)
                                .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5), value: showSmileyFace)
                        }
                    }
                }
            }
            .frame(width: 150)
            .padding(.vertical, 50)
            .onAppear {
                withAnimation {
                    showSmileyFace = true
                }
            }
            Text("Alex's jacket!")
                .font(.title3)
                .foregroundColor(.red)
                .padding(.bottom, 40)
            
            Spacer()
            
            NavigationLink(destination: WinView()) {
                Text("Continue")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .scaleEffect(showSmileyFace ? 1 : 0.5)
                    .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5).delay(0.4), value: showSmileyFace)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

struct WinView: View {
    @State private var showContent = false

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                NavigationLink(destination: ClosedDrawerView()) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .opacity(showContent ? 1 : 0)
                        .offset(x: showContent ? 0 : -20)
                        .animation(.easeInOut(duration: 1).delay(0.2), value: showContent)
                }
                .padding(.leading, 20)
                Spacer()
            }
            Spacer()
            SmileyFace()
                .frame(width: 100, height: 100)
                .transition(.scale)
                .opacity(showContent ? 1 : 0)
                .scaleEffect(showContent ? 1 : 0.5)
                .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5).delay(0.4), value: showContent)
            Spacer()
            Text("You win!")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : 20)
                .animation(.easeInOut(duration: 1).delay(0.6), value: showContent)
            Spacer()
            NavigationLink(destination: ClosedDrawerView()) {
                Text("Return to Start")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .opacity(showContent ? 1 : 0)
                    .scaleEffect(showContent ? 1 : 0.5)
                    .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5).delay(0.8), value: showContent)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                showContent = true
            }
        }
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
        .transition(.scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
