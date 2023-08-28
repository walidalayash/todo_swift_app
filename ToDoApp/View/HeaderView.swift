//
//  HeaderView.swift
//  ToDoApp
//
//  Created by walid alayash on 27/8/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    //let background: y
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:10)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top,40)
        }.frame(width: UIScreen.main.bounds.width * 3,height: 300)
            .offset(y:-135)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
    }
}
