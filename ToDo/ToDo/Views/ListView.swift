//
//  ListView.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/14/22.
// - Utilize the NoItemsView when there are no items in the list
// - Otherwise show the list of items to do
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
            }
        }
        .navigationTitle("📝 To-Do List")
        .navigationBarItems(
            leading:
                EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
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


