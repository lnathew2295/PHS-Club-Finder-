//
//  ClubsListVC.swift
//  clubs
//
//  Created by apcs2 on 11/9/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

var clubId: Int!
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

var action = 0

class ClubsListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let coreData = CoreData()
    
    @IBOutlet weak var clubsListTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(clubList)
        print(favListName)
        
        print(action)
        if action == 0 {
            // Parse the JSON
            parseJSON()
            action = 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubCell", for: indexPath) as! ClubsListCell
        
        let url = URL(string: clubThumbnailList[indexPath.row])
        let data = try? Data(contentsOf: url!)
        
        cell.clubName.text = clubList[indexPath.row]!
        cell.clubType.text = clubTypeList[indexPath.row]!
        cell.clubDesc.text = clubDescList[indexPath.row]!
        cell.clubImg.image = UIImage(data: data!)
        
        print(clubList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        clubId = indexPath.row
        performSegue(withIdentifier: "openPopup", sender: nil)
    }
    
    @IBAction func myClubsBtn(_ sender: Any)
    {
        performSegue(withIdentifier: "toMyCubs", sender: nil)
    
    }
    
    
    func parseJSON()
    {
        let url = URL(string: "http://api.hoogleyboogley.com/apcs2/clubs/")!
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let JSONObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
            {
                //self.stationsList = [String]()
                
                let arrayList = JSONObject.object(forKey: "clubs") as! NSArray
                
                for index in 0..<arrayList.count {
                    
                    let clubsArray = arrayList[index]
                    let clubName = (clubsArray as AnyObject!).object(forKey: "name")!
                    let clubAuthor = (clubsArray as AnyObject!).object(forKey: "author")!
                    let clubSponsor = (clubsArray as AnyObject!).object(forKey: "sponsor")!
                    let clubLocation = (clubsArray as AnyObject!).object(forKey: "location")!
                    let clubTime = (clubsArray as AnyObject!).object(forKey: "time")!
                    let clubtype = (clubsArray as AnyObject!).object(forKey: "type")!
                    let clubDesc = (clubsArray as AnyObject!).object(forKey: "desc")!
                    let clubImg = (clubsArray as AnyObject!).object(forKey: "img")!
                    let clubThumbnail = (clubsArray as AnyObject!).object(forKey: "thumbnail")!
                    
                    clubList.append(clubName as! String)
                    clubAuthorList.append(clubAuthor as! String)
                    clubSponsorList.append(clubSponsor as! String)
                    clubLocationList.append(clubLocation as! String)
                    clubTimeList.append(clubTime as! String)
                    clubTypeList.append(clubtype as! String)
                    clubDescList.append(clubDesc as! String)
                    clubImageList.append(clubImg as! String)
                    clubThumbnailList.append(clubThumbnail as! String)
                    
                }
                
                OperationQueue.main.addOperation {
                    self.clubsListTableView.reloadData()
                }
                
            }
        }
        session.resume()
    }

}
