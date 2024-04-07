//
//  HomePageView.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

import SwiftUI

struct HomePageView: View {
    
    @State var translateManager: TranslateManager = TranslateManager()
    
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
                    
                    Task {
                        let res = await translate(input: originalText)
                        
                        print(res)
                        
                        
                        translateManager.addData(originalText: originalText, translatedText: res)
                        
                    }
                        
                    
                    
                    
                    
                    
                }
                .frame(height: 30)
                .background(.blue)
                .foregroundColor(.white)
                
                TextField("", text: $translatedText)
                    .frame(height: 200)
                    .border(.black)
                    .padding([.leading, .trailing], 10)
                
                
                
                
                NavigationLink(destination: SavedTranslationView(translateManager: translateManager)) {
                        Text("View Saved Translations")
                    }
                .padding(.top, 30)
                
            }
            .navigationTitle("Translate Me")
        }
        .navigationBarTitle("Translate Me")
    }
    
    private func translate(input: String) async -> String {
        let urlString = "https://api.mymemory.translated.net/get?q=\(input)&langpair=en|it"
        
        do {
            let url = URL(string: urlString)!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let translateResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            translatedText = translateResponse.responseData.translatedText
            print("Translated Text: \(translatedText)")
            return translatedText
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return ""
    }

    
    
    
}

#Preview {
    HomePageView()
}
