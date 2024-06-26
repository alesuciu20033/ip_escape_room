//
//  ContentView.swift
//  Clues to the Crime
//
//  Created by Cristina Ciobanu on 18/06/2024.
//


import SwiftUI

// ViewModel to manage the game's state
class GameViewModel: ObservableObject {
    
    @Published var userGuess: String = ""
    @Published var feedbackColor: Color = .clear        // Store data
    @Published var feedbackMessage: String = ""
    @Published var pressedButtons: [Int] = []
    
    private let correctPassword: String = "1987"        // The correct password
    
    // Function to add a digit to the user's guess
    func addDigit(_ digit: Int) {
        if userGuess.count < 4 {                        // The guess is no more than 4 digits
            userGuess.append(String(digit))             // Append the digit to the guess
            pressedButtons.append(digit)                // Track the pressed button
        }
    }
    
    // Function to check if the user's guess is correct
    func checkGuess() {
        if userGuess.count == 4 {                       // Check if the guess has 4 digits
            var correctDigitsInRightPlace = 0           // Track correct digits in right place
            
            // Iterate through each character in the user's guess
            for (index, char) in userGuess.enumerated() {
                let correctChar = correctPassword[correctPassword.index(correctPassword.startIndex, offsetBy: index)]
                if char == correctChar {                // Correct digit in the right place
                    correctDigitsInRightPlace += 1
                }
            }
            
            // feedback message based on the guess
            feedbackMessage = "Numbers in the right place: \(correctDigitsInRightPlace)"
            
            // Set the screen color based on the correctness of the guess
            if correctDigitsInRightPlace == 4 {
                feedbackColor = .green                  // All digits correct
            } else {
                feedbackColor = .red                    // Not all digits correct
            }
            
            userGuess = ""                              // Reset the guess
            pressedButtons = []                         // Reset pressed buttons
        }
    }
}



struct ContentView: View {
    @ObservedObject var viewModel = GameViewModel()
    
    // Layout for the keypad buttons
    let keypadLayout: [[Int]] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [-1, 0, -1]           // -1 represents a blank space
    ]
    
    var body: some View {
        VStack {
            Text("Guess the password to unlock the phone!")
                .font(.system(size: 25, weight: .semibold))
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Text("Enter 4 digits:")
                .font(.system(size: 25))
                .padding(.top, 1)
                .foregroundColor(.white)
            
            
            // Container for the keypad and screen color
            ZStack {
                Color.white.opacity(0.7)
                    .frame(width: 340, height: 470)
                    .cornerRadius(20)
                
                // Loop through the keypad layout rows
                VStack(spacing: 10) {
                    ForEach(keypadLayout, id: \.self) { row in
                        HStack(spacing: 10) {
                            // Loop through each number in the row
                            ForEach(row, id: \.self) { number in
                                if number == -1 {
                                    Spacer()
                                        .frame(width: 70, height: 70)
                                } else {
                                    // Keypad button
                                    Circle()
                                        .fill(viewModel.pressedButtons.contains(number) ? Color.gray.opacity(0.5) : Color.white.opacity(0.9))
                                        .frame(width: 70, height: 70)
                                        .overlay(
                                            Text("\(number)")
                                                .font(.system(size: 30, weight: .bold))
                                                .foregroundColor(.black)
                                        )
                                        .onTapGesture {
                                            // Add the digit to the guess when tapped
                                            viewModel.addDigit(number)
                                            // Check the guess if 4 digits are entered
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
            .background(viewModel.feedbackColor) // Screen color background
            .cornerRadius(20)
            .padding()
            
            // feedback message
            Text(viewModel.feedbackMessage)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 20)
            
           
        }
        .padding()
        .background(Color.black.opacity(0.9))  // Background color of the entire view
    }
}

#Preview {
    ContentView()
}







// Old Code
//import SwiftUI
//
//
//
//class GameViewModel: ObservableObject {   // To manage the game's state
//    
//    @Published var userGuess: String = ""
//    @Published var feedbackColor: Color = .clear  // Store data
//    @Published var pressedButtons: [Int] = []
//    
//    private let correctPassword: String = "1987"
//    
//    
//    // Function to add a digit to the user's guess
//    func addDigit(_ digit: Int) {
//        // The guess is no more than 4 digits
//        if userGuess.count < 4 {
//            // Append the digit to the guess
//            userGuess.append(String(digit))
//            // Track the pressed button
//            pressedButtons.append(digit)
//        }
//    }
//    
//    
//    // Function to check if the user's guess is correct
//    func checkGuess() {
//        // Check if the guess has 4 digits
//        if userGuess.count == 4 {
//            // Check if the guess matches the correct password
//            if userGuess == correctPassword {
//                // Set screen color to green if correct
//                feedbackColor = .green
//            } else {
//                feedbackColor = .red
//            }
//            // Reset the guess and pressed buttons
//            userGuess = ""
//            pressedButtons = []
//        }
//    }
//    
//
//}
//
//
//
//
//
//struct ContentView: View {
//    // ObservedObject to track the ViewModel's state
//    @ObservedObject var viewModel = GameViewModel()
//    
//    
//    // Layout for the keypad buttons
//    let keypadLayout: [[Int]] = [
//        [1, 2, 3],
//        [4, 5, 6],
//        [7, 8, 9],
//        [-1, 0, -1]  // -1 represents a blank space
//    ]
//    var body: some View {
//        VStack {
//            Text("Guess the password to unlock the phone!")
//                .font(.system(size: 25, weight: .semibold))
//                .padding(.top, 110)
//                .multilineTextAlignment(.center)
//                .foregroundColor(.white)
//            
//            Text("Enter 4 digits:")
//                .font(.system(size: 25))
//                .padding(.top, 1)
//                .foregroundColor(.white)
//            
//            // Container for the keypad and screen color
//            ZStack {
//                Color.white.opacity(0.7)
//                    .frame(width: 340, height: 470)
//                    .cornerRadius(20)
//                
//                // Loop through the keypad layout rows
//                VStack(spacing: 10) {
//                    ForEach(keypadLayout, id: \.self) { row in
//                        HStack(spacing: 10) {
//                            // Loop through each number in the row
//                            ForEach(row, id: \.self) { number in
//                                if number == -1 {
//                                    // space
//                                    Spacer()
//                                        .frame(width: 70, height: 70)
//                                } else {
//                                    // Keypad button
//                                    Circle()
//                                        .fill(viewModel.pressedButtons.contains(number) ? Color.gray.opacity(0.5) : Color.white.opacity(0.9))
//                                        .frame(width: 70, height: 70)
//                                        .overlay(
//                                            Text("\(number)")
//                                                .font(.system(size: 30, weight: .bold))
//                                                .foregroundColor(.black)
//                                        )
//                                        .onTapGesture {
//                                            // Add the digit to the guess when tapped
//                                            viewModel.addDigit(number)
//                                            // Check the guess if 4 digits are entered
//                                            if viewModel.userGuess.count == 4 {
//                                                viewModel.checkGuess()
//                                            }
//                                        }
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                .padding()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(viewModel.feedbackColor) // Screen color background
//            .cornerRadius(20)
//            .padding()
//            
//
//            
//            VStack {
//                // Information about the victim
//                Text("Info about the victim:")
//                    .font(.system(size: 25))
//                    .padding(.bottom, 20)
//                    .foregroundColor(.white)
//                
//                Text("Date of birth: 04.02.1987")
//                    .foregroundColor(.white)
//                Text("Time of birth: 08:34 AM")
//                    .foregroundColor(.white)
//                Text("Hobby: Tennis")
//                    .padding(.bottom, 100)
//                    .foregroundColor(.white)
//            }
//            .font(.system(size: 20))
//        }
//        .padding()
//        .background(Color.black.opacity(0.9))  // Background color of the entire view
//
//    }
//}
//
//
//
//#Preview {
//    ContentView()
//}



