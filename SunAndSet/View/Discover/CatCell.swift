//
//  CatCell.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class CatCell: UICollectionViewCell {
    @IBOutlet weak var lblCat: UILabel!
    @IBOutlet weak var imageCat: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.backgroundColor=UIColor.white
        self.layer.cornerRadius=5.0
        self.layer.masksToBounds=false
        self.layer.shadowColor=UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset=CGSize(width: 0, height: 0)
        self.layer.shadowOpacity=0.8
    }
}
