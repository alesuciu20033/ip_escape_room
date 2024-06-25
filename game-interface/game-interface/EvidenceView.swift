//
//  EvidenceView.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 24/06/2024.
//

import SwiftUI

struct EvidenceView: View {
    let evidenceItems = [
        Evidence(title: "Note 1", content: """
        Dear Detective,

        This is your first clue. The serial killer you've been chasing is closer than you think. They blend into the crowd, a master of disguise and deception.

        Good luck, and stay vigilant.

        Yours truly,
        A Concerned Citizen
        """),
        Evidence(title: "Note 2", content: """
        Dear Detective,

        The killer has struck again. This time, they left behind a cryptic message. Pay attention to the patterns.

        Stay safe.

        A Concerned Citizen
        """)
    ]
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedNote: Evidence?
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation {
                        selectedNote = evidenceItems[0]
                    }
                }) {
                    Text("Read Note 1")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    withAnimation {
                        selectedNote = evidenceItems[1]
                    }
                }) {
                    Text("Read Note 2")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            if let note = selectedNote {
                ScrollView {
                    Text(note.content)
                        .padding()
                        .font(.body)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .transition(.move(edge: .bottom))
                .background(Color.gray.opacity(0.2)) // Ensure consistent background
            } else {
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Backpack")
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            }
        )
        .background(Color.gray.opacity(0.2)) // Ensure consistent background
    }
}
