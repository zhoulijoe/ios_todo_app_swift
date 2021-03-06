//
//  RoundCheckbox.swift
//  ToDoSwift
//
//  Created by Zhou on 6/24/15.
//  Copyright (c) 2015 Zhou. All rights reserved.
//

import UIKit

class RoundCheckbox: UIButton {

    let checkedImage: UIImage
    let uncheckedImage: UIImage

    // MARK: Lifecycle

    required init(coder aDecoder: NSCoder) {
        checkedImage = UIImage(named: "checkbox_checked")!
        uncheckedImage = UIImage(named: "checkbox_unchecked")!

        super.init(coder: aDecoder)

       
    }

    var isChecked: Bool = false {
        didSet {
            if (isChecked) {
                setImage(checkedImage, forState: UIControlState.Normal)
            } else {
                setImage(uncheckedImage, forState: UIControlState.Normal)
            }
        }
    }
    
}
