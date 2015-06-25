//
//  TaskCell.swift
//  ToDoSwift
//
//  Created by Zhou on 6/23/15.
//  Copyright (c) 2015 Zhou. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var checkbox: RoundCheckbox!

    // MARK: Lifecycle

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        
    }

    var task: Task? {
        didSet {
            if let task = task {
                summaryLabel.text = task.summary
                checkbox.isChecked = task.complete
            }
        }
    }
}
