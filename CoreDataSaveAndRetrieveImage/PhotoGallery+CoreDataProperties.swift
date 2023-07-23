//
//  PhotoGallery+CoreDataProperties.swift
//  CoreDataSaveAndRetrieveImage
//
//  Created by Sainath Bamen on 16/07/23.
//
//

import Foundation
import CoreData


extension PhotoGallery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoGallery> {
        return NSFetchRequest<PhotoGallery>(entityName: "PhotoGallery")
    }

    @NSManaged public var savedImage: Data?

}

extension PhotoGallery : Identifiable {

}
