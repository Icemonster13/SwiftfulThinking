//
//  ListRowView.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/14/22.
//
// - Single list row model
//


import SwiftUI

struct ListRowView: View {
    
    // MARK: - PROPERTIES
    let item: ItemModel
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .accentColor)
                .font(.title2.bold())
            Text(item.title)
                .font(.title2)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// MARK: - PREVIEW
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
