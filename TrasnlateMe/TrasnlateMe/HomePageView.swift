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
                
                Button("Translate") {
                    // add functionality
                    //translatedText = "Hello World"
                    
                    translate(input: originalText)
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
    
    private func translate(input : String) {
        
        let urlString = "https://api.mymemory.translated.net/get?q=Hello%20World!&langpair=en|it"
        
        Task {
            let url = URL(string: urlString)!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let translateResponse = try JSONDecoder().decode(ResponseTranslate.self, from: data)
                
                let translate = translateResponse.responseData
                print(translate)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
}

#Preview {
    HomePageView()
}
