//
//  ItemModel.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/15/22.
//
// - Model of each to do item
// - Creates two initializers for use
// -- One with an 'id' property
// -- One without an 'id' property
//


import Foundation

struct ItemModel: Identifiable, Codable {
    
    // MARK: - PROPERTIES
    let id: String
    let title: String
    let isCompleted: Bool
    
    // MARK: - INITIALIZER
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // MARK: - METHODS
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
