//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

struct PageOneView: View {
    var body: some View {
            Text("Page One")
                .font(.largeTitle)
    }
}

struct PageTwoView: View {
    var body: some View {
            Text("Page Two")
                .font(.largeTitle)
    }
}

struct PageThreeView: View {
    var body: some View {
            Text("Page Three")
                .font(.largeTitle)
    }
}

struct PageFourView: View {
    var body: some View {
            Text("Page Four")
                .font(.largeTitle)
    }
}

// The page which contains the note
struct PageFiveNoteView: View {
    var body: some View {
            Text("Page Five")
                .font(.largeTitle)
        Image("note")
            .resizable()
            .frame(width: 150, height: 150)
            
    }
}

struct PageSixView: View {
    var body: some View {
            Text("Page Six")
                .font(.largeTitle)
    }
}
