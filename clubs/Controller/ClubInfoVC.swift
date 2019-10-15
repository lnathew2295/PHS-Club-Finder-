//
//  ClubInfoVC.swift
//  clubs
//
//  Created by apcs2 on 11/14/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class ClubInfoVC: UIViewController {
    
    let coreData = CoreData()

    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubType: UILabel!
    @IBOutlet weak var clubTime: UILabel!
    @IBOutlet weak var clubDesc: UITextView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubName.text = clubList[clubId]
        clubType.text = clubTypeList[clubId]
        clubTime.text = "Find us in " + clubLocationList[clubId] + " at " + clubTimeList[clubId]
        clubDesc.text = clubDescList[clubId]
        
        let url = URL(string: clubImageList[clubId])
        let data = try? Data(contentsOf: url!)
        
        clubImage.image = UIImage(data: data!)

    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToListBtn(_ sender: Any) {
        coreData.save(name: clubList[clubId], author: clubAuthorList[clubId], sponsor: clubSponsorList[clubId], location: clubLocationList[clubId], time: clubTimeList[clubId], type: clubTypeList[clubId], desc: clubDescList[clubId])
        print("Club has been saved!")
    }
    
    
}

