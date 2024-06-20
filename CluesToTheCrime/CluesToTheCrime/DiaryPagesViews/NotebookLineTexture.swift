//
//  NotebookLineTexture.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 20.06.24.
//

import SwiftUI
import CoreHaptics

struct NotebookLineTexture: View {
    var body: some View {
        Image("paper-texture")
            .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
        
        Image("notebook-lines")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0.5)
    }
}
