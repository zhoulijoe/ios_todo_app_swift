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
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var taskToEdit: Task?
    var changed: Bool = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender as? UIBarButtonItem != saveButton) {
            return
        }

        let textCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! EditDescriptionCell
        let updatedDescription = textCell.textField.text

        if (updatedDescription.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty) {
            return
        }

        if let task = taskToEdit {
            task.summary = updatedDescription
            TaskStore.sharedInstance.updateTask(task)
        } else {
            TaskStore.sharedInstance.addTask(Task(id: nil, summary: updatedDescription))
        }
        changed = true
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
            if let summary = task.summary
                where !summary.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty {
                cell.textField.text = summary
            }
        }

        return cell
    }
}
