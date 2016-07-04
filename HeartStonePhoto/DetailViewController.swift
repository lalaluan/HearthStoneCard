//
//  DetailViewController.swift
//  HeartStonePhoto
//
//  Created by nju on 16/6/7.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var image: UIImageView!
    
    //@IBOutlet var recognizer: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(DetailViewController.cancel))

        let lastVC = ((self.presentingViewController as! UINavigationController).topViewController as! MainTableViewController)
        
        self.image.image = lastVC.photos[lastVC.index.row].image
        // Do any additional setup after loading the view.
        
        //let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(DetailViewController.slide))
        let gesture = UITapGestureRecognizer(target: self, action:
            #selector(DetailViewController.slide))
        self.image.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func slide(recognizer: UITapGestureRecognizer){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /*@IBAction func selectImageFromPhotoLibrary(sender: UIScreenEdgePanGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
