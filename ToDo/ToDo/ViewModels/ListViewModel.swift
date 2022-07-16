//
//  ListViewModel.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/15/22.
//
// - Publish the items array for the entire app
// - Utilize the didSet modifier to ensure any change to the items array is caught
// - CRUD functions are accounted for in the METHODS block
//


import Foundation

class ListViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    // MARK: - INITIALIZER
    init() {
        getItems()
    }
    
    // MARK: - METHODS
    
    // Create
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

    // Read
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    // Update
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    // Delete
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
