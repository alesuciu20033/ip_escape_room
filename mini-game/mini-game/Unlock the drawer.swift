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
            UnlockDrawerView()
        }
    }
}

struct UnlockDrawerView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Unlock the ")
                .font(.title)
                + Text("drawer")
                    .font(.title)
                    .foregroundColor(.red)
                + Text(" and see what's inside!")
                    .font(.title)
            
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
        
