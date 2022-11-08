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
    
   
    var array = ["California", "Texas","Oklahoma", "Hawaii", "Arizona", "Main", "New York"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension MainViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
    }
    
    
    
    
}



