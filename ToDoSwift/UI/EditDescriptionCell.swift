//
//  EditDescriptionCell.swift
//  ToDoSwift
//
//  Created by Zhou on 6/17/15.
//  Copyright (c) 2015 Zhou. All rights reserved.
//

import UIKit

class EditDescriptionCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!

    override func prepareForReuse() {
        super.prepareForReuse()

//        textField.placeholder = "Enter description"
    }
}
