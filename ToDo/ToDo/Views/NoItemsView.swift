//
//  NoItemsView.swift
//  ToDo
//
//  Created by Michael Pascucci on 7/15/22.
//
// - Creates a view for when there are no to do items
//


import SwiftUI

struct NoItemsView: View {
    
    // MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items in your list!")
                    .font(.title)
                    .fontWeight(.heavy)
                Image("Todo-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                Text("Your list is empty.")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Let's add some items so we can check them off the list!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                    Text("Add Something!")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimating ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, isAnimating ? 30 : 50)
                .shadow(
                    color: isAnimating ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: isAnimating ? 30 : 10,
                    x: 0.0,
                    y: isAnimating ? 50 : 30)
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                .offset(y: isAnimating ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - METHODS
    func addAnimation() {
        guard !isAnimating else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                isAnimating.toggle()
            }
         }
    }
}

// MARK: - PREVIEW
struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("📝 To-Do List")
        }
    }
}
