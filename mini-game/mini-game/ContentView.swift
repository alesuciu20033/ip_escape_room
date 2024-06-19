//
//  ContentView.swift
//  mini-game
//
//  Created by okb abdullah on 18/06/2024.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ClueFoundView()
    }
}

struct ClueFoundView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Clue found!")
                .font(.largeTitle)
                .foregroundColor(.red)
                .bold()
                .padding(.top, 40)
            
            (Text("You unlocked the drawer and found a ")
                .font(.title2)
                + Text("BUTTON!")
                    .font(.title2)
                    .foregroundColor(.red)
                    .underline())
                .multilineTextAlignment(.center)
            
            ZStack {
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
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        VStack {
                            Spacer()
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .padding(.bottom, 10)
                        }
                    }
                }
                .frame(width: 100)
            }
            
            (Text("It seems that this button is from ")
                .font(.title3)
                + Text("Alex's jacket!")
                    .font(.title3)
                    .foregroundColor(.red))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                // Add action for continue button
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

