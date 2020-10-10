//
//  SourcesModel.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

struct SourcesModel: Codable {
    let sources: [Sources]
}

struct Sources:  Codable {
    let name: String?
}
