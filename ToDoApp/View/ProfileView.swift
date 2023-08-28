//
//  ProfileView.swift
//  ToDoApp
// Create by Walid Alayash
//
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("Profile")
                .toolbar{
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
