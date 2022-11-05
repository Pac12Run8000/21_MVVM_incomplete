//
//  MainViewController.swift
//  MVVMAPICallAcronyms
//
//  Created by Norbert Grover on 11/4/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World 233")
        
        NetworkingService.shared.fetchAPIResponse(url: URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=wa")!) { result in
            switch result {
            case .failure(let err):
                print("Error: \(err)")
            case .success(let data):
                print("Data: \(data)")
            }
        }
    }


}

