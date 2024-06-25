//
//  EvidenceView.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 24/06/2024.
//

import SwiftUI

struct EvidenceView: View {
    @Binding var unlockedEvidence: [Evidence]
    @Binding var unlockedItems: [Item]
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedContent: String?

    var body: some View {
        VStack {
            Text("Backpack")
                .font(.largeTitle)
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if unlockedEvidence.isEmpty && unlockedItems.isEmpty {
                        Text("No evidence or items unlocked yet.")
                            .padding()
                            .font(.body)
                            .background(Color.white)
                            .cornerRadius(10)
                            .background(Color.gray.opacity(0.2))
                    } else {
                        if !unlockedEvidence.isEmpty {
                            Text("Notes")
                                .font(.headline)
                                .padding(.leading)

                            ForEach(unlockedEvidence) { evidence in
                                Button(action: {
                                    withAnimation {
                                        selectedContent = evidence.content
                                    }
                                }) {
                                    Text(evidence.title)
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding([.leading, .trailing])
                            }
                        }

                        if !unlockedItems.isEmpty {
                            Text("Items")
                                .font(.headline)
                                .padding(.leading)
                                .padding(.top)

                            ForEach(unlockedItems) { item in
                                Button(action: {
                                    withAnimation {
                                        selectedContent = item.description
                                    }
                                }) {
                                    Text(item.title)
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding([.leading, .trailing])
                            }
                        }
                    }
                }

                if let content = selectedContent {
                    VStack(alignment: .leading) {
                        Text(content)
                            .padding()
                            .font(.body)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .background(Color.gray.opacity(0.2))
                    .transition(.move(edge: .bottom))
                    .padding()
                } else {
                    Spacer()
                    Text("Select a note or item to read.")
                        .padding()
                        .font(.body)
                        .background(Color.white)
                        .cornerRadius(10)
                        .background(Color.gray.opacity(0.2))
                        .padding()
                }
            }
        }
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            }
        )
        .padding()
        .navigationBarTitle("Backpack", displayMode: .inline)
    }
}
