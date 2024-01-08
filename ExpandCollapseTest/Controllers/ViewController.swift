//
//  ViewController.swift
//  ExpandCollapseTest
//
//  Created 08/01/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tblView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register( UINib(nibName: TestCell.className, bundle: nil), forCellReuseIdentifier: TestCell.className)
        table.register( UINib(nibName: SubHeaderCell.className, bundle: nil), forCellReuseIdentifier: SubHeaderCell.className)
        table.tableHeaderView = UIView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorColor = .gray
        return table
    }()
    
    var arrData : [DataModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        arrData = [
            DataModel(mainTitle: "Mobile Development", subTitle: ["iOS","Android","React Native","Flutter"], isExpand: false),
            DataModel(mainTitle: "Languages", subTitle: ["Swift","Kotlin","Dart"], isExpand: false),
            DataModel(mainTitle: "Fruits", subTitle: ["Apple","Mango"], isExpand: false),
            DataModel(mainTitle: "Vegetables", subTitle: ["Potato","Cabbage","Brinjal","Onion","Cauliflower","Others"], isExpand: false)
        ]
    }
    func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(tblView)
        tblView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}


extension ViewController:UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let data = arrData[section]
       if data.isExpand {
           return data.subTitle.count + 1
       } else {
           return 1
       }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.className, for: indexPath) as! TestCell
            cell.selectionStyle = .none
            cell.configure(data: arrData[indexPath.section])
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: SubHeaderCell.className, for: indexPath) as! SubHeaderCell
            cell.selectionStyle = .none
            cell.configure(data: arrData[indexPath.section], withRow: indexPath.row)
            return cell
        }
        
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index",indexPath.row)
        let toSet = !arrData[indexPath.section].isExpand
        arrData.forEach {
            $0.isExpand = false
        }
        arrData[indexPath.section].isExpand = toSet
        tableView.reloadData()
    }
}
