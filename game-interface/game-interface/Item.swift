//
//  Item.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 25/06/2024.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
