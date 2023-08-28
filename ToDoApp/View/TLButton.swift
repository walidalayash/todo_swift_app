//
//  TLButton.swift
//  ToDoApp
//
//

import SwiftUI

struct TLButton: View {
    let tilte: String
    let background: Color
    let action: ()-> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(tilte)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(tilte: "Value", background: .pink){
            //Action
        }
    }
}
