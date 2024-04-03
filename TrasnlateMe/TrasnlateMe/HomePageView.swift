//
//  HomePageView.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var originalText : String = ""
    @State private var translatedText : String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your text", text: $originalText)
                    .frame(height: 50)
                    .border(.black)
                    .padding([.leading, .trailing], 10)
                
                // adjust buttons ui
                Button("Translate") {
                    // add action
                    translatedText = "Hello World"
                }
                .frame(height: 30)
                .background(.blue)
                .foregroundColor(.white)
                
                TextField("", text: $translatedText)
                    .frame(height: 200)
                    .border(.black)
                    .padding([.leading, .trailing], 10)
                
                
                
                
                NavigationLink(destination: SavedTranslationView()) {
                        Text("View Saved Translations")
                    }
                .padding(.top, 30)
                
            }
            .navigationTitle("Translate Me")
        }
        .navigationBarTitle("Translate Me")
    }
}

#Preview {
    HomePageView()
}
