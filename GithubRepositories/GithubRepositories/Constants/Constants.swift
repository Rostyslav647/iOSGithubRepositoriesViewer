//
//  Constants.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/23/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import Foundation

typealias CompletionHandler<T> = (_ :T?) -> ()

// Url Constants
let BASE_URL = "https://api.github.com"
let GET_REPOSITORIES_URL = "\(BASE_URL)/orgs/cocoapods/repos"
