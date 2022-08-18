//
//  EditScreen.swift
//  SiftuiMVVM


import SwiftUI

struct EditScreen: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewmodel = EditViewModel()
    
    @State var title2 = ""
    @State var body2 = ""
    
    var body: some View {
        VStack{
            TextField("Enter a new title!", text: $title2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
            TextField("Enter a new content!", text: $body2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
                .padding(.bottom, 20)
            Button(action: {
                viewmodel.apiEditPost(post: Post(title: title2, body: body2))
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Spacer()
                Text("Edit").foregroundColor(.white)
                Spacer()
            }).frame(width: 180, height: 50).background(.blue)
        }
    }
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen()
    }
}
