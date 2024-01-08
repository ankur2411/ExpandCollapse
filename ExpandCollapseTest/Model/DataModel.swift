//
//  DataModel.swift
//  ExpandCollapseTest
//
//  Created on 08/01/24.
//

import Foundation
class DataModel {
    
    let mainTitle: String
    let subTitle: [String]
    var isExpand: Bool = false
    
    init(mainTitle: String, subTitle: [String], isExpand: Bool = false) {
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.isExpand = isExpand
    }
}
