//
//  MyClubsInfoVC.swift
//  clubs
//
//  Created by apcs2 on 12/11/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class MyClubsInfoVC: UIViewController {
    
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
        clubTime.text = "Find us at " + clubLocationList[clubId] + " at " + clubTimeList[clubId]
        clubDesc.text = clubDescList[clubId]

    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func removeBtn(_ sender: Any) {
        //context.delete(favListName[clubId])
        print(clubId)
    }

    

}
