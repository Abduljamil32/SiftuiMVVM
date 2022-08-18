//
//  EditViewModel.swift
//  SiftuiMVVM


import Foundation

class EditViewModel: ObservableObject{
    
    @Published var editPost: Post?
    
    func apiEditPost(post: Post){
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            switch response.result{
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
}
