//
//  ContentView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var noteOffset: CGFloat = 0
    @State private var showFallingNote = false
    @State private var stage = 0
    @State private var noteVisible = false
    @State private var hideDiary = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                
                if !hideDiary {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            PageViewControllerWrapper(pages: createPages())
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.6)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
                if showFallingNote || stage > 0 {
                    VStack {
                        Spacer()
                        if stage == 0 {
                            Text("What is this?")
                                .foregroundStyle(.black)
                                .font(.system(size: 50, design: .serif))
                                .padding(.bottom, geometry.size.height * 0.8)
                        } else if stage == 1 {
                            VStack {
                                Text("There was a hidden note between the pages!")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 38, design: .serif))
                                    .padding()
                                Text("Tap to inspect it")
                                    .foregroundStyle(.red)
                                    .font(.system(size: 36, design: .serif))
                                    .padding(.bottom)
                            }
                            .padding(.bottom, geometry.size.height * 0.8)
                        } else if stage == 2 {
                            VStack {
                                Text("Clue found!")
                                    .foregroundStyle(.red)
                                    .font(.system(size: 50, design: .serif))
                                    .bold()
                                    .padding(.top, 100)
                                Spacer()
                                Text("Looks like our victim was afraid of someone already...")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 30, design: .serif))
                                    .padding(.bottom, 100)
                            }
                        }
                        Spacer()
                    }
                }
                
                if noteVisible {
                    if stage == 0 {
                        Image("folded-note")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(y: noteOffset)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    noteOffset = geometry.size.height * 0.4
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    stage = 1
                                }
                            }
                    } else if stage == 1 {
                        Image("hidden-note")
                            .resizable()
                            .frame(width: 260, height: 260)
                            .offset(y: noteOffset)
                            .onTapGesture {
                                withAnimation {
                                    stage = 2
                                    hideDiary = true
                                }
                            }
                    } else if stage == 2 {
                        Image("note")
                            .resizable()
                            .frame(width: 600, height: 630)
                            .offset(y: 0)
                            .zIndex(10)
                    }
                }
                
            }
        }
    }

    // Creating an array of UIViewControllers to be used as pages which use UIHostingController, embedding the views in view controllers
    func createPages() -> [UIViewController] {
        let cover = UIHostingController(rootView: CoverView())
        let page1 = UIHostingController(rootView: PageOneView())
        let page2 = UIHostingController(rootView: PageTwoView())
        let page3 = UIHostingController(rootView: PageThreeView())
        let page4 = UIHostingController(rootView: PageFourView())
        let page5 = UIHostingController(rootView: PageFiveNoteView(showFallingNote: $showFallingNote, noteVisible: $noteVisible, stage: $stage, hideDiary: $hideDiary))
        let page6 = UIHostingController(rootView: PageSixView())
        
        return [cover, page1, page2, page3, page4, page5, page6]
    }
}

#Preview {
    ContentView()
}
