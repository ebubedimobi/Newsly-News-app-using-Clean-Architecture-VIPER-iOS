//
//  SignUpPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class SignUpPresenter {
    
    var router : SignUpRouterProtocol?
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    
}

extension SignUpPresenter: SignUpPresenterProtocol {
   
    
    func alreadyHaveAccount() {
        router?.createLoginPage()
    }
    
    func addPhotoTapped() {
        self.router?.routeToImagePicker(delegate: self)
    }
    
    // MARK: Need to consider using data type from now on instead of UIImage (to prevent loading UIKit)
    func register(email: String?, password: String?, image: UIImage?, fullName: String?) {
        //TODO: -  handle error if user doesn't completer
        guard
            let email = email,
            let password = password,
            let image = image,
            let fullName = fullName else { return }
        interactor?.signUp(email: email, password: password, image: image, fullName: fullName)
    }
}

extension SignUpPresenter: SignUpPresenterInput {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.view?.presentAlert(title: title, message: message, action: action)
    }
}

extension SignUpPresenter: ImagePickerManagerDelegate {
    func imageGotten(image: UIImage) {
        view?.updateImage(image: image)
    }
    
    
}
