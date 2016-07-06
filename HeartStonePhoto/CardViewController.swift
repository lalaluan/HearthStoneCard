//
//  CardViewController.swift
//  HeartStonePhoto
//
//  Created by nju on 16/7/6.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var life: UIImageView!
    @IBOutlet weak var magic: UIImageView!
    @IBOutlet weak var attack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
