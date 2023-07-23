//
//  DatabaseHandler.swift
//  CoreDataSaveAndRetrieveImage
//
//  Created by Sainath Bamen on 16/07/23.
//

import Foundation
import CoreData
import UIKit


class DatabaseHandler{
    var image:UIImage? = nil
    func saveImage(){
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let photoObject = NSEntityDescription.insertNewObject(forEntityName: "PhotoGallery", into: context) as! PhotoGallery
        photoObject.savedImage = image?.jpegData(compressionQuality: 1) as Data?
        do{
            try context.save()
            print("Data has been saved")
            
        }
        catch{
            print("Error Occured While Saving Data")
        }
        
    }
    
    func retrieveData() -> [PhotoGallery]{
        var photos = [PhotoGallery]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        do{
            photos = try (context.fetch(PhotoGallery.fetchRequest()))
            
        }
        catch{
            print("Error While Fetching Data")
        }
        
        return photos
        
    }
}
