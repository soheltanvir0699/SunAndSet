//
//  LocationCell.swift
//  SunAndSet
//
//  Created by User on 7/16/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var ImageCheckd: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  ImageCheckd.isHidden=true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
