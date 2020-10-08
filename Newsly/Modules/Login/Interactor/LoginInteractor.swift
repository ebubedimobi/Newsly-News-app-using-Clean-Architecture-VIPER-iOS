//
//  LoginInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation




final class SignInInteractor: SignInInteractorInput {
    
   var profileService: ProfileServiceProtocol?
    
    func signIn(email: String, password: String) {
        profileService?.signIn(email: email, password: password)
    }
    
}
