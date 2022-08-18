//
//  EditViewModel.swift
//  SiftuiMVVM


import Foundation

class EditViewModel: ObservableObject{
    
    
    @Published var isLoading = false
    
    func apiPostUpdate(post: Post, handler: @escaping (Bool) -> Void) {
        isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            switch response.result  {
            case .success:
                self.isLoading = false
                handler(true)
                print(response.result)
            case let .failure(error):
                handler(false)
                print(error)
            }
        })
    }
    
    
}
