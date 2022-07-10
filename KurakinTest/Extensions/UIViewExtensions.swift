//
//  UIViewExtensions.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit
extension UIView{
   @IBInspectable var cornerRadius : CGFloat{
        get{return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
