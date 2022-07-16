//
//  ToDoApp.swift
//  ToDo
//
//  Created by Michael & Diana Pascucci on 7/13/22.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
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
