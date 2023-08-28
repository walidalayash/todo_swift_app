//
//  MainView.swift
//  ToDoApp
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
                ToDoListView()
        }else{
            LoginView()
        }
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }

