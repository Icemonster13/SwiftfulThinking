//
//  AddView.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/15/22.
//
// - Used to create a new to do list item
// - METHODS could probably be moved to a different file to clean up this file
//


import SwiftUI

struct AddView: View {
    
    // MARK: - PROPERTIES
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentatioMode
    
    @State private var isShowingAlert: Bool = false
    @State private var alertTitle: String = ""
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(16)
        }
        .navigationTitle("✏️ Add an Item")
        .alert(isPresented: $isShowingAlert, content: getAlert)
    }
    
    // MARK: - METHODS
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentatioMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            isShowingAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

// MARK: - PREVIEW
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
