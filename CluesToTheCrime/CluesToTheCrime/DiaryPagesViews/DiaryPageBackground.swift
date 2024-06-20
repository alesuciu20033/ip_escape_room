//
//  DiaryPageBackground.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 20.06.24.
//

import SwiftUI

struct DiaryPageBackground: View {
    var body: some View {
        Color(red: 1.0, green: 0.98, blue: 0.94)
            .ignoresSafeArea()
            .overlay(
                NotebookLineTexture()
                    .edgesIgnoringSafeArea(.top)
            )
    }
}
