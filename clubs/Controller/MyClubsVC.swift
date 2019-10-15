//
//  MyClubsVC.swift
//  clubs
//
//  Created by apcs2 on 11/9/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

var refreshControl: UIRefreshControl!
class MyClubsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let coreData = CoreData()
    @IBOutlet weak var myClubsTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if action == 0 {
            coreData.get()
            action = 1
        }
        
        myClubsTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favListName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavClubCell", for: indexPath) as! FavClubsCell
        
        cell.clubName.text = clubList[indexPath.row]
        cell.clubType.text = clubTypeList[indexPath.row]
        cell.clubDesc.text = clubDescList[indexPath.row]
        
        print(favListName[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        clubId = indexPath.row
        performSegue(withIdentifier: "openPopup", sender: nil)
    }

}
