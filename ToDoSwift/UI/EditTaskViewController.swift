//
//  EditTaskViewController.swift
//  ToDoSwift
//
//  Created by Zhou on 6/17/15.
//  Copyright (c) 2015 Zhou. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var taskToEdit: Task?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("editDescriptionCell", forIndexPath: indexPath) as! EditDescriptionCell

        cell.textField.placeholder = "Enter description"

        if let task = taskToEdit {
            if let description = task.description
                where !description.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty {
                cell.textField.text = description
            }
        }

        return cell
    }
    
}
