//
//  ContentView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var stage = 0
    @State private var noteOffset: CGFloat = 0
    
    @State private var noteVisible = false
    @State private var hideFallingNote = true
    @State private var hideDiary = true
    @State private var hideDiaryOnTable = false
    @State private var hideBlueprint = true
    @State private var hideBlueprintOnTable = false
    @State private var hideParticles = false
    @State private var hideText = false
    @State private var blurBackground = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("steampunk-office")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: blurBackground ? 5 : 0)
                
                if !hideBlueprintOnTable {
                    Image("rolled-blueprint")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .offset(x: 240, y: 30)
                        .rotationEffect(.degrees(100))
                        .onTapGesture {
                            withAnimation {
                                hideBlueprint = false
                                hideParticles = true
                                hideDiaryOnTable = true
                                hideBlueprintOnTable = true
                                blurBackground = true
                            }
                        }
                }
                
                if !hideBlueprint {
                    Color.black
                        .opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 100) {
                        Text("This was probably the last project of Damon...")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.system(size: 38, weight: .bold, design: .serif))
                        
                        Image("blueprint")
                            .resizable()
                            .frame(width: 732, height: 442)
                        
                        Text("Nothing useful here.")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.system(size: 38, weight: .bold, design: .serif))
                            .padding(.bottom, 50)
                    }.onTapGesture {
                        withAnimation {
                            hideBlueprint = true
                            hideParticles = false
                            hideDiaryOnTable = false
                            hideBlueprintOnTable = false
                            blurBackground = false
                        }
                    }
                }
                
               
                
                if !hideDiaryOnTable {
                     StrokeText(text: "So this is where Damon worked...", width: 2, color: .black)
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .shadow(color: .black, radius: 2)
                    .offset(y: -40)

                    Image("closed-diary")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: 95, y: 410)
                        .rotationEffect(.degrees(-20))
                        .onTapGesture {
                            withAnimation {
                                hideDiary = false
                                hideDiaryOnTable = true
                                hideParticles = true
                                blurBackground = true
                            }
                        }
                }
                
                if !hideParticles {
                    ParticleEffect(targetSize: CGSize(width: 100, height: 100))
                        .frame(width: 100, height: 100)
                        .offset(x: 225, y: 340)
                    
                    ParticleEffect(targetSize: CGSize(width: 450, height: 450))
                        .frame(width: 450, height: 450)
                        .offset(x: -70, y: 220)
                }
                
                if !hideDiary {
                    Color.black
                        .opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    
                    Text((hideText ? "" : "This has to be his diary..."))
                        .foregroundStyle(.white)
                        .font(.system(size: 42, weight: .bold, design: .serif))
                        .offset(y: -450)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                self.hideText.toggle()
                            }
                        }
                    
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
                
                if !hideFallingNote || stage > 0 {
                    VStack {
                        Spacer()
                        if stage == 0 {
                            Text("What is this?")
                                .foregroundStyle(.white)
                                .font(.system(size: 42, weight: .bold, design: .serif))
                                .padding(.bottom, geometry.size.height * 0.8)
                        } else if stage == 1 {
                            VStack {
                                Text("There was a hidden note between the pages!")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 42, weight: .bold, design: .serif))
                                    .padding()
                            }
                            .padding(.bottom, geometry.size.height * 0.8)
                        }
                        Spacer()
                    }
                }
                
                if noteVisible {
                    if stage == 0 {
                        Image("folded-note")
                            .resizable()
                            .frame(width: 270, height: 270)
                            .offset(y: noteOffset)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    noteOffset = geometry.size.height * 0.37
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
                            .frame(width: 200, height: 200)
                            .offset(y: noteOffset)
                            .onTapGesture {
                                withAnimation {
                                    stage = 2
                                    hideDiary = true
                                }
                            }
                    } else if stage == 2 {
                        Color.black
                            .opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Text("Clue found!")
                                .foregroundStyle(.red)
                                .font(.system(size: 54, weight: .bold, design: .serif))
                                .padding(.bottom, 80)
                                .zIndex(10)
                            
                            Image("note")
                                .resizable()
                                .frame(width: 500, height: 550)
                                .offset(y: -50)
                                .zIndex(10)
                        
                            Text("Looks like our victim was already afraid of someone...")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .font(.system(size: 38, weight: .bold, design: .serif))
                                .padding(.top, 50)
                                .zIndex(10)
                        }
                       
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
        let page5 = UIHostingController(rootView: PageFiveNoteView(showFallingNote: $hideFallingNote, noteVisible: $noteVisible, stage: $stage, hideDiary: $hideDiary))
        let page6 = UIHostingController(rootView: PageSixView())
        
        return [cover, page1, page2, page3, page4, page5, page6]
    }
}

#Preview {
    ContentView()
}


