//
//  CreateScreen.swift
//  SiftuiMVVM


import SwiftUI

struct CreateScreen: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewmodel = CreateViewModel()
    
    @State var title1 = ""
    @State var body1 = ""
    
    var body: some View {
        VStack{
            TextField("Enter a title!", text: $title1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
            TextField("Enter a content!", text: $body1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10).padding(.trailing, 10)
                .padding(.bottom, 20)
            Button(action: {
                viewmodel.apiCreatePost(post: Post(title: title1, body: body1))
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Spacer()
                Text("Create").foregroundColor(.white)
                Spacer()
            }).frame(width: 180, height: 50).background(.blue)
        }
    }
}

struct CreateScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateScreen()
    }
}
