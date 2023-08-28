//
//  NameItemView.swift
//  ToDoApp
// Create by Walid Alayash
//
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var NewItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            Form {
                //title
                TextField("title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(tilte:"Save" , background: .pink){
                    if viewModel.canSave {
                        viewModel.save()
                        NewItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }
            .alert(isPresented:$viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all field and select due date that is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(
            NewItemPresented: Binding(get: {
                return true
            }, set: {
                _ in
            }))
    }
}
