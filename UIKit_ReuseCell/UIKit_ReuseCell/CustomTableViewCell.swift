//
//  CustomTableViewCell.swift
//  UIKit_ReuseCell
//
//  Created by 강창현 on 1/8/24.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .none
        textLabel?.text = nil
        print("prepareForReuse()")
    }
    
    func setUpCell(index: Int) {
        textLabel?.text = String(index)
    }
}
