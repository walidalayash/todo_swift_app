//
//  RegisterView.swift
//  ToDoApp
// Create by Walid Alayash
//
//

import SwiftUI

struct RegisterView: View {
//    @State var name = ""
//    @State var email = ""
//    @State var passwaord = ""
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack{
            HeaderView(
                title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                SecureField("Passwaord", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(tilte: "Create Accoubt", background: .green) {
                    viewModel.register()
                    // Attempt log in
                }
            }
           
            .offset(y: -50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
