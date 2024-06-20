//
//  ContentView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                
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
        }
    }
    
    // Creating an array of UIViewControllers to be used as pages which use UIHostingController, embedding the views in view controllers
    func createPages() -> [UIViewController] {
        let page1 = UIHostingController(rootView: PageOneView())
        let page2 = UIHostingController(rootView: PageTwoView())
        let page3 = UIHostingController(rootView: PageThreeView())
        let page4 = UIHostingController(rootView: PageFourView())
        let page5 = UIHostingController(rootView: PageFiveNoteView())
        let page6 = UIHostingController(rootView: PageSixView())
        
        return [page1, page2, page3, page4, page5, page6]
    }
}

#Preview {
    ContentView()
}
