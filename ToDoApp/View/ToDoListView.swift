//
//  ToDoListView.swift
//  ToDoApp
// Create by Walid Alayash
//
//
import FirebaseFirestoreSwift
import FirebaseAuth
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoListItem]
   let firebaseAuth = Auth.auth()
 //   private let userId: String
    init(userId: String){
       // self.userId = userId
        // user/<id>/todos/<entries>
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos"
        )
    }

    var body: some View {
    NavigationView{
    
        VStack{
            List(items) { item in
                ToDoListItemView(item: item)
                    .swipeActions{
                        Button("delete"){
                            viewModel.delete(id: item.id)
                        }
                        .foregroundColor(Color.red)
                    }
            }
            .listStyle(PlainListStyle())
            
        }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
//                    do {
//                      try firebaseAuth.signOut()
//                    } catch let signOutError as NSError {
//                      print("Error signing out: %@", signOutError)
//                    }
                 viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(NewItemPresented: $viewModel.showingNewItemView)
            }
        
    }
        }
    }


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId:"YsKPDKLV1iXnbYAlGPVi69TfmN02")
    }
}
