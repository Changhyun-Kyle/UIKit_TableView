//
//  SceondViewController.swift
//  UIKit_TableView
//
//  Created by 강창현 on 1/3/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    var textToSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textLabel.text = textToSet
    }
}
