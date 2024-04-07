import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct message: Hashable, Identifiable, Codable {
    var id: String
    let originalWord : String
    let translatedWord : String
}


class TranslateManager: ObservableObject{
    
    @Published var translations = [message]()
    
    private let database = Firestore.firestore()
    
    func getData() {
        database.collection("translationHistory").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.translations = snapshot.documents.map { d in
                            return message(id: d.documentID, originalWord: d["orginalText"] as? String ?? "", translatedWord: d["translatedText"] as? String ?? "")
                        }
                    }
                }
                
            }
            else {
                
            }
        }
    }
    
    func addData(originalText: String, translatedText: String) {
        
        database.collection("translationHistory").addDocument(data: ["orginalText": originalText, "translatedText": translatedText]) { error in
            
            if error == nil {
                self.getData()
            }
            else {
                
            }
        }
        
    }
    
    func deleteAllDataInCollection() {
            database.collection("translationHistory").getDocuments { [weak self] snapshot, error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                
                guard let snapshot = snapshot else { return }
                
                for document in snapshot.documents {
                    document.reference.delete { error in
                        if let error = error {
                            print("Error deleting document: \(error)")
                        } else {
                            print("Document successfully deleted")
                        }
                    }
                }
                
                self.getData()
            }
        }
    
    
    
}


