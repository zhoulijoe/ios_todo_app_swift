import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.rowHeight = 50.0
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(_tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskStore.sharedInstance.tasks.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! UITableViewCell
        let task = TaskStore.sharedInstance.tasks[indexPath.row]

        cell.textLabel?.text = task.description

        return cell
    }

    // MARK: - Table view delegate

}

