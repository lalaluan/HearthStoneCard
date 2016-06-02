//
//  MainTableViewController.swift
//  HeartStonePhoto
//
//  Created by nju on 16/5/31.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var photos = [Photo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let files = loadPhotos(){
            photos += files
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.tableView!.registerClass(MyTableViewCell.self, forCellWithReuseIdentifier: "Cell")
        //self.tableView!.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "Cell")
        //tableView.registerNib(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MyTableViewCell

        // Configure the cell...
        
        
        //cell.photoImage.image = UIImage(CGImage: photos[indexPath.row])
        
        //cell.photoImage.backgroundColor = UIColor.blackColor()
        
        //cell.photoImage.setNeedsDisplay()
        
        //cell.imageView?.clipsToBounds = true
        
        cell.imageView?.image = photos[indexPath.row].image
        
        cell.imageView?.backgroundColor = UIColor.blackColor()
        //cell.imageView?.bounds = CGRect(x: 0, y: 0, width: 90, height: 90)
        
        //cell.imageView?.image?.drawInRect(CGRect(x: 0, y: 0, width: 90, height: 90))
        
        //}

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.photos.append(Photo(image: selectedImage))
        
        self.tableView?.reloadData()
        
        savePhotos()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: BUTTON
    
    @IBAction func selectImageFromLibrary(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func TakePhoto(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .Camera
        
        imagePickerController.allowsEditing = true
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    // MARK:NSCording
    func savePhotos() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(photos, toFile: Photo.contentURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadPhotos() -> [Photo]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Photo.contentURL.path!) as? [Photo]
    }
    
}
