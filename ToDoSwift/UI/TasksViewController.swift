import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var selectedTask: Task?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todo List"

        tableView.delegate = self
        tableView.dataSource = self
        // Prevent empty cell being created after last cell
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier where identifier == "editTaskSegue" {
            let navigationVC = segue.destinationViewController as! UINavigationController
            let editDescriptionVC = navigationVC.topViewController as! EditTaskViewController
            
            editDescriptionVC.taskToEdit = selectedTask
        }
    }

    // MARK: UITableViewDataSource

    func numberOfSectionsInTableView(_tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskStore.sharedInstance.tasks.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! UITableViewCell
        let task = TaskStore.sharedInstance.tasks[indexPath.row]

        cell.textLabel?.text = task.summary
        if (task.complete) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }

    // MARK: UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

        selectedTask = TaskStore.sharedInstance.tasks[indexPath.row]

        performSegueWithIdentifier("editTaskSegue", sender: self)
    }

    // MARK: Action handler

    @IBAction func unwindToTasks(segue: UIStoryboardSegue) {
        let editTaskVC = segue.sourceViewController as! EditTaskViewController

        if (editTaskVC.changed) {
            tableView.reloadData()
        }
    }
}

