//
//  Photo.swift
//  HeartStonePhoto
//
//  Created by nju on 16/6/2.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class Photo : NSObject, NSCoding{
    
    static let documentsDir = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let contentURL = documentsDir.URLByAppendingPathComponent("content.data")

    
    var image: UIImage
    
    // MARK:properties
    struct PropertyKey {
        static let imageKey = "image"
    }
    
    
    init(image: UIImage){
        self.image = image
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(image, forKey: PropertyKey.imageKey)
    }
    
    required convenience init(coder aDecoder: NSCoder){
        let image = aDecoder.decodeObjectForKey(PropertyKey.imageKey) as? UIImage
        
        self.init(image: image!)
    }
    
    
}


class PhotoSaver: NSOperation {
    //1
    let photos: [Photo]
    
    //2
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    //3
    override func main() {
        //4
        if self.cancelled {
            return
        }
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(photos, toFile: Photo.contentURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
        
        
    }
}
