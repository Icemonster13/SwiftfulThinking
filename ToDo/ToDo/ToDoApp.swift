//
//  ToDoApp.swift
//  ToDo
//
//  Created by Michael & Diana Pascucci on 7/13/22.
//
// - Create a StateObject here of the ListViewModel and inject it into the entire NavigationView
// using the environmentObject.
//
// - Utilize the navigationViewStyle(StackNavigationViewStyle()) to ensure large devices
// do not create a sidebar for the list view
//


import SwiftUI

@main
struct ToDoApp: App {
    
    // MARK: - PROPERTIES
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
