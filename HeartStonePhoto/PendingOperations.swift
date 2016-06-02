//
//  PendingOperations.swift
//  HeartStonePhoto
//
//  Created by nju on 16/6/2.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit


class PendingOperations {
    
    /*
        loadSaveProgress use for persist data 
     */
    lazy var loadSaveProgress = [NSIndexPath:NSOperation]()
    lazy var loadSaveQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "loading photo queue"
        //        queue.maxConcurrentOperationCount = 5
        return queue
    }()
    
    /*lazy var filtrationsInProgress = [NSIndexPath:NSOperation]()
    lazy var filtrationQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "Image Filtration queue"
        //        queue.maxConcurrentOperationCount = 5
        return queue
    }()*/
}
