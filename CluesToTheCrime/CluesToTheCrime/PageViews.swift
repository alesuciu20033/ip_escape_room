//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI
import CoreHaptics

struct PageOneView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
           Text("Page One")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}

struct PageTwoView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            Text("Page Two")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}

struct PageThreeView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            Text("Page Three")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}

struct PageFourView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            Text("Page Four")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}

// The page which contains the note
struct PageFiveNoteView: View {
    @State private var stage = 0
    @StateObject private var hapticFeedbackManager = HapticFeedbackManager()
    
    var body: some View {
        ZStack {
                Color(red: 1.0, green: 0.98, blue: 0.94)
                    .ignoresSafeArea()
            
            VStack {
                if stage == 0 {
                    VStack(spacing: 50) {
                        Text("What is this?")
                            .foregroundStyle(.black)
                            .font(.system(size: 32, design: .serif))
                        
                        Image("folded-note")
                            .resizable()
                            .frame(width: 380, height: 380)
                        
                    }
                    .onAppear {
                        hapticFeedbackManager.playHapticFeedback()
                    }
                    .onTapGesture {
                        withAnimation {
                            stage = 1
                        }
                    }
                } else if stage == 1 {
                    VStack(spacing: 50) {
                        Text("There was a hidden note between the pages!")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.black)
                            .font(.system(size: 32, design: .serif))
                            .padding()
                        Text("Tap to inspect it")
                            .foregroundStyle(.red)
                            .font(.system(size: 28, design: .serif))
                            .padding(.bottom)
                        Image("hidden-note")
                            .resizable()
                            .frame(width: 280, height: 280)
                    }
                    .onTapGesture {
                        withAnimation {
                            stage = 2
                        }
                    }
                } else if stage == 2 {
                    VStack(spacing: 50) {
                        Text("Clue found!")
                            .foregroundStyle(.red)
                            .font(.system(size: 36, design: .serif))
                            .bold()
                            .padding(.bottom)
                        
                        Image("note")
                            .resizable()
                            .frame(width: 320, height: 320)
                        
                        Text("Looks like our victim was afraid of someone already...")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.gray)
                            .font(.system(size: 20, design: .serif))
                            .padding()
                    }
                }
            }
        }
    }
}

struct PageSixView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            Text("Page Six")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}
