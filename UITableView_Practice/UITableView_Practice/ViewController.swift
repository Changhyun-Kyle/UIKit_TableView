//
//  ViewController.swift
//  UITableView_Practice
//
//  Created by 강창현 on 1/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var famousPersonTableView: UITableView!
    private let cellIndentifier: String = "cell"
    private var famousPeople = [FamousPerson]()
    private let jsonData = """
    [
        {
            "name": "알버트 아인슈타인",
            "occupation": "이론 물리학자",
            "birthplace": "독일",
            "works": "상대성 이론"
        },
        {
            "name": "마하트마 간디",
            "occupation": "독립 운동 지도자",
            "birthplace": "인도",
            "works": "비폭력 저항"
        },
        {
            "name": "마더 테레사",
            "occupation": "로마 가톨릭 수녀",
            "birthplace": "알바니아",
            "works": "가난한 이들 돕기"
        }
    ]
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        loadData()
    }
    
    private func setUpTableView() {
        famousPersonTableView.delegate = self
        famousPersonTableView.dataSource = self
    }
    
    private func loadData() {
        let decoder = JSONDecoder()
        guard 
            let data = jsonData.data(using: .utf8) 
        else {
            return print("Error: - 데이터 변환 에러")
        }
        
        do {
            famousPeople =  try decoder.decode([FamousPerson].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(famousPeople)
        return famousPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        let famousPerson = famousPeople[indexPath.section]
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = famousPerson.occupation
        case 1:
            cell.textLabel?.text = famousPerson.birthplace
        case 2:
            cell.textLabel?.text = famousPerson.works
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(famousPeople[section].name)
        return famousPeople[section].name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return famousPeople.count
    }
}
