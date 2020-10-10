//
//  FavouritesInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

//presenter to interactor
protocol FavouritesInteractorInput {
    func searchByName(by name: String, articles: [Article]) -> [Article]
    func loadFavouriteArticles(completion: @escaping ([Article]?) -> ())
    func loadProfileImage(completion: @escaping (UIImage?) -> ())
    func getUserInfo() -> (name: String?, email: String?)
    func saveImageToDataBase(image: UIImage?, completion: @escaping() -> ())
    func signOut()
}
