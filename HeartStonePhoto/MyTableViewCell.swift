//
//  MyTableViewCell.swift
//  HeartStonePhoto
//
//  Created by nju on 16/5/31.
//  Copyright © 2016年 CX. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        self.imageView!.bounds = CGRectMake(0,0,60,100);
        
        self.imageView!.frame = CGRectMake(0,0,60,100);
        
        self.imageView!.contentMode = .ScaleToFill
    }
}
