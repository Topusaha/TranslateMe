//
//  SavedTranslationView.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

import SwiftUI

struct SavedTranslationView: View {
    
    @ObservedObject private var translateManager: TranslateManager
  
    
    var body: some View {
        VStack {
            
            List (translateManager.translations) {item in
                Text("\(item)")
            }
            
            
            Button("Delete History") {
                translateManager.deleteAllDataInCollection()
            }
            
        }
    }
    
    init(translateManager: TranslateManager) {
        self.translateManager = translateManager
        self.translateManager.getData()
    }
    
   
}

#Preview {
    SavedTranslationView(translateManager: TranslateManager())
}
