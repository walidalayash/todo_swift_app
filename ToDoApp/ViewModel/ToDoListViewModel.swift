//
//  ToDoListViewModel.swift
//  ToDoApp
//
// Create by Walid Alayash
//
//
import FirebaseFirestore
import Foundation
//ViewModel for list of items view

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
