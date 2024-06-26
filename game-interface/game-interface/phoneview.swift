//
//  phoneview.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 25/06/2024.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var userGuess: String = ""
    @Published var feedbackColor: Color = .clear
    @Published var triesLeft: Int = 4
    @Published var pressedButtons: [Int] = []
    
    private let correctPassword: String = "1987"
    
    func addDigit(_ digit: Int) {
        if userGuess.count < 4 {
            userGuess.append(String(digit))
            pressedButtons.append(digit)
        }
    }
    
    func checkGuess() {
        if userGuess.count == 4 {
            if userGuess == correctPassword {
                feedbackColor = .green
            } else {
                feedbackColor = .red
                triesLeft -= 1
            }
            userGuess = ""
            pressedButtons = []
        }
    }
    
    func resetGame() {
        userGuess = ""
        feedbackColor = .clear
        triesLeft = 4
        pressedButtons = []
    }
}

struct PhoneView: View {
    @ObservedObject var viewModel = GameViewModel()
    
    let keypadLayout: [[Int]] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [-1, 0, -1]
    ]
    
    var body: some View {
        VStack {
            Text("Guess the password to unlock the phone!")
                .font(.system(size: 25, weight: .semibold))
                .padding(.top, 110)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Text("Enter 4 digits:")
                .font(.system(size: 25))
                .padding(.top, 1)
                .foregroundColor(.white)
            
            ZStack {
                Color.white.opacity(0.7)
                    .frame(width: 340, height: 470)
                    .cornerRadius(20)
                
                VStack(spacing: 10) {
                    ForEach(keypadLayout, id: \.self) { row in
                        HStack(spacing: 10) {
                            ForEach(row, id: \.self) { number in
                                if number == -1 {
                                    Spacer()
                                        .frame(width: 70, height: 70)
                                } else {
                                    Circle()
                                        .fill(viewModel.pressedButtons.contains(number) ? Color.gray.opacity(0.5) : Color.white.opacity(0.9))
                                        .frame(width: 70, height: 70)
                                        .overlay(
                                            Text("\(number)")
                                                .font(.system(size: 30, weight: .bold))
                                                .foregroundColor(.black)
                                        )
                                        .onTapGesture {
                                            viewModel.addDigit(number)
                                            if viewModel.userGuess.count == 4 {
                                                viewModel.checkGuess()
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(viewModel.feedbackColor)
            .cornerRadius(20)
            .padding()
            
            if viewModel.triesLeft == 0 {
                VStack {
                    Text("Game Over! Reset to try again.")
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Button(action: {
                        viewModel.resetGame()
                    }) {
                        Text("Reset")
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                }
            } else {
                Spacer()
            }
            
            VStack {
                Text("Info about the victim:")
                    .font(.system(size: 25))
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                
                Text("Date of birth: 04.02.1987")
                    .foregroundColor(.white)
                Text("Time of birth: 08:34 AM")
                    .foregroundColor(.white)
                Text("Hobby: Tennis")
                    .padding(.bottom, 100)
                    .foregroundColor(.white)
            }
            .font(.system(size: 20))
        }
        .padding()
        .background(Color.black.opacity(0.9))
    }
}



#Preview {
    PhoneView()
}
