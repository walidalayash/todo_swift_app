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
                
                //                .toolbar{
                //                    Button {
                //
                //                    } label: {
                //                        Image(systemName: "plus")
                //                    }
                //                }
                if let user = viewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading")
                }
            }
        }.navigationTitle("Profile")
            .onAppear {
                viewModel.fetchUser()
    }
        
        }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width:125, height: 125)
            .padding()
        
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                Text(user.name)
            }.padding()
            HStack{
                Text("Email:")
                Text(user.email)
            }.padding()
            HStack{
                Text("Member Since:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
        }.padding()
      
        Button("Logout"){
            viewModel.logOut()
        }
        .tint( .red)
        .padding()
    }
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
