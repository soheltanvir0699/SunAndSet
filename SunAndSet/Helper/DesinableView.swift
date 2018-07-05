//
//  DesinableView.swift
//  SunAndSet
//
//  Created by User on 7/5/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

@IBDesignable class DesinableView: UIView {
    @IBInspectable var cornerRadius : CGFloat=0{
        didSet{
            
            self.layer.cornerRadius=cornerRadius
            
        }}
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            
            self.layer.borderColor=borderColor.cgColor
            
            
        }}
    @IBInspectable var borderwidth : CGFloat = 0.0{
        didSet{
            
            self.layer.borderWidth=borderwidth
            
            
        }
    }
}

