//
//  Tag.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import Foundation

typealias Tags = [Tag]

struct Tag: Codable {
    let name, zipballURL, tarballURL: String?
    let commit: Commit

    enum CodingKeys: String, CodingKey {
        case name
        case zipballURL = "zipball_url"
        case tarballURL = "tarball_url"
        case commit
    }
}

struct Commit: Codable {
    let sha, url: String?
}

extension Array where Element == Tags.Element {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Tags.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

