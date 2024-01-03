//
//  ViewController.swift
//  UIKit_TableView
//
//  Created by 강창현 on 1/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","G","H","I","G","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var dates: [Date] = []
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    let timeeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        // tableView.reloadData()
        // MARK: - IndexSet: 몇번째 범위의 섹션 인덱스를 reload할 것인가
        tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: - UITableViewCell을 활용하는 dequeueReusableCell을 사용했기 때문에 as 타입 캐스팅 필요
        guard 
            let customCell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as? CustomTableViewCell 
        else {
            return UITableViewCell()
        }
        
        guard
            indexPath.section < 2
        else {
            customCell.leftLabel.text = dateFormatter.string(from: dates[indexPath.row])
            customCell.rightLabel.text = timeeFormatter.string(from: dates[indexPath.row])
            return customCell
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        cell.textLabel?.text = text
        
        // MARK: - Cell의 재사용
//        let cell = UITableViewCell()
//        if indexPath.row == 1 {
//            cell.backgroundColor = .red
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard 
            section < 2
        else {
            return nil
        }
        return section == 0 ? "한글" : "영어"
    }
}
