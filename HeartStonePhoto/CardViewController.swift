//
//  CardViewController.swift
//  HeartStonePhoto
//
//  Created by nju on 16/7/6.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class CardViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var life: UIImageView!
    @IBOutlet weak var magic: UIImageView!
    @IBOutlet weak var attack: UIImageView!
    @IBOutlet weak var nameT: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var descL: UILabel!
    
    var result:UIImage = UIImage()
    
    var tableView:MainTableViewController = MainTableViewController()
    
    //var numbers = ["0","1","2","3","4","5","6","7","8","9"]
    var numbers:[UIImage] = []
    var picker:UIPickerView = UIPickerView()
    
    var canSave = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource=self
        picker.delegate=self
        
        picker.selectRow(1,inComponent:0,animated:true)
        picker.selectRow(2,inComponent:0,animated:true)
        picker.selectRow(3,inComponent:0,animated:true)
        
        picker.frame = CGRectMake(0, 500, 350, 100)
        picker.hidden = true
        picker.userInteractionEnabled = false
        picker.backgroundColor = UIColor.whiteColor()
        picker.opaque = true
        picker.alpha = 0.9
        
        self.view.addSubview(picker)
        // Do any additional setup after loading the view.
        
        for i in 0...9{
            numbers.append(UIImage(named: String(i)+".png")!)
        }
        nameT.delegate = self
        desc.delegate = self
        
        tableView = (self.presentingViewController as! UINavigationController).topViewController as! MainTableViewController
        
        photo.image = tableView.photoToMake
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        if canSave{
            let size = CGSize(width: (self.card.frame.width + 10),
                          height: (self.card.frame.height+30))
        
            UIGraphicsBeginImageContext(size);//全屏截图，包括window
        
            self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
            result = UIGraphicsGetImageFromCurrentImageContext();
        
            UIGraphicsEndImageContext();
        
            UIImageWriteToSavedPhotosAlbum(result, nil, nil, nil);
            
            tableView.photos.append(Photo(image: result))
            
            tableView.tableView.reloadData()
            
            tableView.savePhotos(tableView.photos.count)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
            picker.hidden = true
            picker.userInteractionEnabled = false
            canSave = true
            magic.image = numbers[picker.selectedRowInComponent(0)]
            attack.image = numbers[picker.selectedRowInComponent(1)]
            life.image = numbers[picker.selectedRowInComponent(2)]
        }
    }

    @IBAction func cancle(sender: AnyObject) {
        if canSave{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
            picker.hidden = true
            picker.userInteractionEnabled = false
            canSave = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - GestureRecognizer
    @IBAction func tapMag(sender: AnyObject) {
        picker.hidden = false
        picker.userInteractionEnabled = true
        canSave = false
    }
    
    @IBAction func tapCard(sender: AnyObject) {
        nameT.hidden = false
        nameT.userInteractionEnabled = true
        desc.hidden = false
        desc.userInteractionEnabled = true
        canSave = false
        //text.setNeedsFocusUpdate()
    }
    
    // MARK: - PickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    
    /*func getPickerViewValue(){
        let alertView=UIAlertView();
        alertView.title="被选中的索引为"
        alertView.message=String(pickerView.selectedRowInComponent(0)) + "-"
            + String(pickerView!.selectedRowInComponent(1)) + "-"
            + String(pickerView.selectedRowInComponent(2))
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }*/
    
    /*func textViewDidEndEditing(textView: UITextView) {
        textView.
    }*/
    func textFieldDidEndEditing(textField: UITextField) {
        nameL.text = nameT.text
        descL.text = desc.text
        nameT.hidden = true
        nameT.userInteractionEnabled = false
        desc.hidden = true
        desc.userInteractionEnabled = false
        canSave = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
