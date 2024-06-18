//
//  DiaryView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct DiaryView: View {
    @State private var showTip: Bool = false
    @State private var openedDiary: Bool = false
    
    @State private var stage = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 70) {
                Text("A \(Text("diary").foregroundColor(.red)) was found in the room...")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, design: .serif))
                
                VStack {
                    if openedDiary {
                        Image("opened-diary")
                            .resizable()
                            .frame(width: 340, height: 260)
                            .padding(25)
                            .onTapGesture {
                                withAnimation {
                                    openedDiary = false
                                }
                            }
                    } else {
                        Image("closed-diary")
                            .resizable()
                            .frame(width: 290, height: 310)
                            .onTapGesture {
                                withAnimation {
                                    openedDiary = true
                                }
                            }
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
            }
        }
    }
}

#Preview {
    DiaryView()
}
