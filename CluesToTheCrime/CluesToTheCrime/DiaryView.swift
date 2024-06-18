//
//  DiaryView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct DiaryView: View {
    @State private var showTip: Bool = false
    @State private var stage = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                if stage == 0 {
                    Text("A \(Text("diary").foregroundColor(.red)) was found in the room...")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, design: .serif))
                    
                    Image("closed-diary")
                        .resizable()
                        .frame(width: 290, height: 300)
                        .padding(50)
                        .padding(.bottom)
                        .onTapGesture {
                            withAnimation {
                                stage = 1
                            }
                        }
                    
                    VStack {
                        if showTip {
                            Text("There might be something hidden between the pages...")
                                .foregroundStyle(.white)
                                .padding()
                        } else {
                            Button(action: {
                                withAnimation {
                                    showTip = true
                                }
                            }) {
                                Text("Tip?")
                                    .padding(12)
                                    .background(Color.gray)
                                    .foregroundStyle(.white)
                                    .cornerRadius(8)
                                    .bold()
                            }
                        }
                    }
                } else if stage == 1 {
                    VStack(spacing: 70) {
                        Text("Maybe on another page...")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, design: .serif))
                        
                        Image("opened-diary")
                            .resizable()
                            .frame(width: 320, height: 260)
                            .onTapGesture {
                                withAnimation {
                                    stage = 2
                                }
                            }
                    }
                    .padding(.bottom, 60)
                } else if stage == 2 {
                    VStack(spacing: 50) {
                        VStack {
                            Text("There is a hidden note inside!")
                                .foregroundStyle(.white)
                                .font(.system(size: 24, design: .serif))
                                .padding()
                            Text("Tap to inspect it")
                                .foregroundStyle(.red)
                                .font(.system(size: 22, design: .serif))
                                .padding(.bottom)
                        }
                        
                        VStack {
                            Image("opened-diary-note")
                                .resizable()
                                .frame(width: 320, height: 260)
                                .zIndex(1)
                            
                            Image("hidden-note")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .position(x: 230, y: -30)
                            
                        }
                    }.padding(.top, 115)
                        .onTapGesture {
                            withAnimation {
                                stage = 3
                            }
                        }
                } else if stage == 3 {
                    VStack(spacing: 20) {
                        Text("Clue found!")
                            .foregroundStyle(.red)
                            .font(.system(size: 30, design: .serif))
                            .bold()
                            .padding(.bottom)
                        
                        Image("note")
                            .resizable()
                            .frame(width: 280, height: 320)
                            .onTapGesture {
                                withAnimation {
                                    stage = 0
                                }
                            }
                        
                        Text("Looks like our victim was afraid of someone already...")
                            .foregroundStyle(.gray)
                            .font(.system(size: 20, design: .serif))
                            .padding(.top, 50)
                    }
                }
            }
        }
    }
}

#Preview {
    DiaryView()
}
