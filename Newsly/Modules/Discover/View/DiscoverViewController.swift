//
//  DiscoverViewController.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

class DiscoverViewController: UIViewController {

    var presenter: DiscoverPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }

}


extension DiscoverViewController: DiscoverViewInput {
    
}