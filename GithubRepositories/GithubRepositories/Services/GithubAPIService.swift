//
//  GithubAPIService.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/23/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire

class GithubAPIService {
    
    static let shared = GithubAPIService()
    
    // Variables
    let decoder = JSONDecoder()
    
    func getRepositories(_ completion: @escaping CompletionHandler<Repositories>) {
        
        Alamofire.request(GET_REPOSITORIES_URL).responseDecodableObject(decoder: decoder) {(response: DataResponse<Repositories>) in
            if let repo = response.result.value{
                completion(repo)
            } else {
                debugPrint(response.result.error as Any)
                completion(nil)
            }
        }
    }
    
    func getTags(url: URL, completion: @escaping CompletionHandler<Tags>) {
    
        Alamofire.request(url).responseDecodableObject(decoder: decoder){
            (response: DataResponse<Tags>) in
            if let tags = response.result.value{
                completion(tags)
            } else {
                debugPrint(response.result.error as Any)
                completion(nil)
            }
        }
    }
}
