//
//  SourceInteractorProtocol.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

//presenter to interactor
protocol SearchInteractorInput: class {
    func fetchSearchedArticles(filter: String)
}
