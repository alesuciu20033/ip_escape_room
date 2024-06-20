//
//  TextSection.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 20.06.24.
//

import SwiftUI

struct TextSection: View {
    var date: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(date)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding([.top, .leading])
                Spacer()
            }
            Text(text)
                .foregroundColor(.black)
                .padding()
        }
    }
}
