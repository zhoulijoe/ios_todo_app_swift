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
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskCell
        let task = TaskStore.sharedInstance.tasks[indexPath.row]

        cell.task = task

        return cell
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let taskCell = tableView.cellForRowAtIndexPath(indexPath) as! TaskCell
        let task = taskCell.task

        if (editingStyle == .Delete) {
            TaskStore.sharedInstance.deleteTask(task!.id!)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    // MARK: UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

        selectedTask = TaskStore.sharedInstance.tasks[indexPath.row]

        performSegueWithIdentifier("editTaskSegue", sender: self)
    }

    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }

    // MARK: Action handler

    @IBAction func unwindToTasks(segue: UIStoryboardSegue) {
        let editTaskVC = segue.sourceViewController as! EditTaskViewController

        if (editTaskVC.changed) {
            tableView.reloadData()
        }
    }
}

