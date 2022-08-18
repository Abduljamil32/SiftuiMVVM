
//  HomeScreen.swift
//  SiftuiMVVM


import SwiftUI

struct HomeScreen: View {
    
    
    @ObservedObject var viewmodel = HomeViewModel()
    @State private var showEdit = false
    
    func delete(indexSet: IndexSet){
        let post = viewmodel.posts[indexSet.first!]
        viewmodel.apiPostDelete(post: post, handler: { value in
            if value{
                viewmodel.apiPostList()
            }
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
/* list starts*/List{
            ForEach(viewmodel.posts, id:\.self){post in
                PostCell(post: post).onLongPressGesture{
                    viewmodel.post = post
                    showEdit.toggle()
                }.sheet(isPresented: $showEdit, content: {
                    EditScreen(post: viewmodel.post)
                })
                
            }.onDelete(perform: delete)
            
        }.listStyle(PlainListStyle())//list ends
                if viewmodel.isLoading{
                    ProgressView()
                }
            }
            .navigationBarTitle("SwiftUI MVVM", displayMode: .inline)
            .navigationBarItems(leading:
                    Button(action: {
                        viewmodel.apiPostList()
            }, label: {
                Image(systemName: "arrow.clockwise")
            }), trailing:
                    NavigationLink(destination: CreateScreen(), label: {
                        Image(systemName: "plus")
            }))
        }.onAppear{
            viewmodel.apiPostList()
        }
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
