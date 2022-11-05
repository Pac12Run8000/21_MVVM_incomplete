//
//  MainViewController.swift
//  MVVMAPICallAcronyms
//
//  Created by Norbert Grover on 11/4/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var testSearchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupBindings()
        
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        viewModel.populateTableView(input: testSearchField.text)
    }
    
}

extension MainViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = viewModel.list.value[indexPath.row]
        return cell!
    }
    
    
    
    
}

// Databinding
extension MainViewController {
    
    private func setupBindings() {
        viewModel.list.bind { [weak self] list in
            
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                strongSelf.tableView.reloadData()
            }
        }
    }
    
}

