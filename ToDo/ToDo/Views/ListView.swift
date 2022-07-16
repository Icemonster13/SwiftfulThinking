//
//  ListView.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/14/22.
// - Utilize the NoItemsView when there are no items in the list
// - Otherwise show the list of items to do
// - Edit button is shown only if the list has items
//


import SwiftUI

struct ListView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var listViewModel: ListViewModel
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
            }
        }
        .navigationTitle("📝 To-Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

// MARK: - PREVIEW
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


