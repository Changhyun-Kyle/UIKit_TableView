//
//  ViewController.swift
//  UIKit_ReuseCell
//
//  Created by 강창현 on 1/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func address(of object: UnsafeRawPointer) -> String{
        let address = Int(bitPattern: object)
        return String(format: "%p", address)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setUpCell(index: indexPath.row)
        
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        }
        var addressCell = cell
        print("cellForRowAt - \(indexPath.section), \(indexPath.row), \(address(of: &addressCell))")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var cell = cell
        print("UITableView : willDisplay - \(indexPath.section), \(indexPath.row), \(address(of: &cell))")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var cell = cell
        print("UITableView : didEndDisplaying - \(indexPath.section), \(indexPath.row), \(address(of: &cell))")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


