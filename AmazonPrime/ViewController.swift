//
//  ViewController.swift
//  AmazonPrime
//
//  Created by Appinventiv Mac on 27/02/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableVew:UITableView!
    var catog = ["","Watch Next TV and Movies","","Latest Movies","","Seasons","","TV Series","","Sports"]
    // static var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVew.delegate=self
        tableVew.dataSource=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
extension ViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = indexPath.row
        if rows == 0{
            let cell = tableVew.dequeueReusableCell(withIdentifier: "TopTVC", for: indexPath) as? TopTVC
            return cell!
        }
        else if (rows % 2 != 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC", for: indexPath) as? HeaderTVC
            cell?.headingLB.text=catog[indexPath.row]
            return cell!
        } else {
            let cell = tableVew.dequeueReusableCell(withIdentifier: "HorizontalTVC", for: indexPath) as? HorizontalTVC
            cell?.rows = indexPath.row
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rows = indexPath.row
        if rows == 0{
            return 200
            
        }else if (rows % 2 != 0){
            return 40
        }
        else{
            return 150
        }
    }
    
}

