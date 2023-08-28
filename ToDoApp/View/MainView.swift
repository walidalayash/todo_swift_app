//
//  MainView.swift
//  ToDoApp
// Create by Walid Alayash
//
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        //        NavigationView{
        //            LoginView()
        //        }
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //sign in
            accountView
            
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }

