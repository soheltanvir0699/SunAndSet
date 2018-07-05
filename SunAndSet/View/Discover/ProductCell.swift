//
//  ProductCell.swift
//  SunAndSet
//
//  Created by User on 6/21/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var lblKind: UILabel!
    @IBOutlet weak var ImagePro: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    @IBOutlet weak var lblDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //contentview.layer.backgroundColor = UIColor(red:240/255.0, green:240/255.0, blue:240/255.0, alpha: 1.0).cgColor
        CardView.backgroundColor=UIColor.white
        CardView.layer.cornerRadius=2.0
        CardView.layer.masksToBounds=false
        CardView.layer.shadowColor=UIColor.black.withAlphaComponent(0.2).cgColor
        CardView.layer.shadowOffset=CGSize(width: 0, height: 0)
        CardView.layer.shadowOpacity=0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
