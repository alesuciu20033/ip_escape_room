//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct PageOneView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("Page One")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct PageTwoView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("Page Two")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct PageThreeView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("Page Three")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct PageFourView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("Page Four")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

// The page which contains the note
struct PageFiveNoteView: View {
    @State private var stage = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                if stage == 0 {
                    VStack(spacing: 50) {
                        Text("What is this?")
                            .foregroundStyle(.white)
                            .font(.system(size: 50, design: .serif))
                        
                        Image("folded-note")
                            .resizable()
                            .frame(width: 550, height: 550)
                    } .onTapGesture {
                        withAnimation {
                            stage = 1
                        }
                    }
                } else if stage == 1 {
                    VStack(spacing: 50) {
                        Text("There was a hidden note between the pages!")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.system(size: 42, design: .serif))
                            .padding()
                        Text("Tap to inspect it")
                            .foregroundStyle(.red)
                            .font(.system(size: 38, design: .serif))
                            .padding(.bottom)
                        Image("hidden-note")
                            .resizable()
                            .frame(width: 480, height: 480)
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
                            .font(.system(size: 50, design: .serif))
                            .bold()
                            .padding(.bottom)
                        
                        Image("note")
                            .resizable()
                            .frame(width: 560, height: 600)
                        
                        Text("Looks like our victim was afraid of someone already...")
                            .foregroundStyle(.gray)
                            .font(.system(size: 32, design: .serif))
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
            Color.black
                .ignoresSafeArea()
            Text("Page Six")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}
