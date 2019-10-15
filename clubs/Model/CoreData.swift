//
//  CoreData.swift
//  clubs
//
//  Created by apcs2 on 11/28/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import Foundation
import CoreData

let insertItem = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context)

class CoreData {
    
    func save(name: String, author: String, sponsor: String, location: String, time: String, type: String, desc: String) {
        
        insertItem.setValue(name, forKey: "clubName")
        print(name)
        insertItem.setValue(author, forKey: "clubAuthor")
        print(author)
        insertItem.setValue(sponsor, forKey: "clubSponsor")
        print(sponsor)
        insertItem.setValue(location, forKey: "clubLocation")
        print(location)
        insertItem.setValue(time, forKey: "clubTime")
        print(time)
        insertItem.setValue(type, forKey: "clubType")
        print(type)
        insertItem.setValue(desc, forKey: "clubDesc")
        print(desc)
        print("[CoreData.swift] Data has been saved for club '" + name + "'!")
        
        do
        {
            try context.save()
            print("It was saved!")
        }
        catch
        {
            // ERRORRRRRRR
        }
    }
    
    
    
    func get() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            print(results.count)
            print(results)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject]
                {
                    print("Club:")
                    if let name = result.value(forKey: "clubName") as? String {
                        favListName.append(name)
                        print(name)
                    }
                    
                    if let author = result.value(forKey: "clubAuthor") as? String {
                        favListAuthor.append(author)
                        print(author)
                    }
                    
                    if let sponsor = result.value(forKey: "clubSponsor") as? String {
                        favListSponsor.append(sponsor)
                        print(sponsor)
                    }
                    
                    if let location = result.value(forKey: "clubLocation") as? String {
                        favListLocation.append(location)
                        print(location)
                    }
                    
                    if let time = result.value(forKey: "clubTime") as? String {
                        favListTime.append(time)
                        print(time)
                    }
                    
                    if let type = result.value(forKey: "clubType") as? String {
                        favListType.append(type)
                        print(type)
                    }
                    
                    if let desc = result.value(forKey: "clubDesc") as? String {
                        favListDesc.append(desc)
                        print(desc)
                    }
                    
                    print("[CoreData.swift] Data has been loaded for a club!")
                }
            }
        }
        catch
        {
            print("Error!")
        }
    }
}
