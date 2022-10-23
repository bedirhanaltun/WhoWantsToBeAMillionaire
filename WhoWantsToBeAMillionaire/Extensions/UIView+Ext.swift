//
//  UIView+Ext.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 22.10.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return cornerRadius }
        set{ self.layer.cornerRadius = newValue }
    }
}
