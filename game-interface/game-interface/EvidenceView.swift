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
    @State private var selectedItem: Item?

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

                            HStack(spacing: 10) {
                                ForEach(unlockedEvidence) { evidence in
                                    Button(action: {
                                        withAnimation {
                                            selectedContent = evidence.content
                                            selectedItem = nil // Deselect item if a note is selected
                                        }
                                    }) {
                                        Text(evidence.title)
                                            .font(.subheadline)
                                            .padding(10)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            .padding([.leading, .trailing])
                        }

                        if !unlockedItems.isEmpty {
                            Text("Items")
                                .font(.headline)
                                .padding(.leading)
                                .padding(.top)

                            HStack(spacing: 10) {
                                ForEach(unlockedItems) { item in
                                    Button(action: {
                                        withAnimation {
                                            if item.title == "Phone" {
                                                selectedItem = item
                                                selectedContent = nil
                                            } else {
                                                selectedContent = item.description
                                                selectedItem = nil
                                            }
                                        }
                                    }) {
                                        Text(item.title)
                                            .font(.subheadline)
                                            .padding(10)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            .padding([.leading, .trailing])
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
                } else if let item = selectedItem, item.title == "Phone" {
                    PhoneView()
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
