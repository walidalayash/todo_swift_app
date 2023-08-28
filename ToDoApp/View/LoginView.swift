//
//  LoginView.swift
//  ToDoApp
// Create by Walid Alayash
//
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
//    @State var email = ""
//    @State var password = ""
    var body: some View {
        NavigationView{
            //Header
            VStack{
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                //login form
              
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(tilte: "Log In", background: .blue ) {
                        viewModel.login()
                        // Attempt log in
                    }
                    .padding()
                }
                .offset(y: -50)
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account",
                    destination: RegisterView())
                }.padding(.bottom,50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
