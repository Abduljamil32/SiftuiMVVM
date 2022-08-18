//
//  EditScreen.swift
//  SiftuiMVVM


import SwiftUI

struct EditScreen: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewmodel = EditViewModel()
    
    @State var title2 = ""
    @State var body2 = ""
    
    var post: Post
    
    func updatePost() {
        let post = Post(id: post.id!, title: title2, body: body2)
        viewmodel.apiPostUpdate(post: post, handler: { isUpdated in
            if isUpdated {
                presentation.wrappedValue.dismiss()
            }
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                TextField("Enter a new title!", text: $title2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 10).padding(.trailing, 10)
                
                TextField("Enter a new content!", text: $body2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 10).padding(.trailing, 10)
                    .padding(.bottom, 20)
                
                Button(action: {
                    updatePost()
                    
                }, label: {
                    Spacer()
                    Text("Edit").foregroundColor(.white)
                    Spacer()
                }).frame(width: 180, height: 50).background(.blue)
                
               
            }
            if viewmodel.isLoading {
                ProgressView()
                    .padding(20)
                    .background(Color.white.opacity(0.4))
            }
        }.onAppear{
            title2 = post.title!
            body2 = post.body!
        }
    }
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen(post: Post())
    }
}
