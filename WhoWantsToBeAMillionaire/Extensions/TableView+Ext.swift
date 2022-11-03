//
//  TableView+Ext.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 26.10.2022.
//

import UIKit

extension UITableView {
    
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
