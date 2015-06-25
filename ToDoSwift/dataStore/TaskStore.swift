import Foundation

class TaskStore {
    static let sharedInstance = TaskStore()

    // List of current tasks
    var tasks: [Task]

    // MARK: Lifecycle

    init() {
        tasks = TaskStore.createMockTasks()
    }

    class func createMockTasks() -> [Task] {
        var mockTasks = [
            Task(id: "1", summary: "Learn Swift"),
            Task(id: "2", summary: "Buy milk"),
            Task(id: "3", summary: "Feed cat")
        ]

        let taskCount = mockTasks.count
        for i in 1...20 {
            let taskId = taskCount + i
            mockTasks.append(Task(id: "\(taskId)", summary: "Task\(taskId)"))
        }

        return mockTasks
    }

    // MARK: Public API

    func addTask(task: Task) {
        let taskId = getNextId()
        task.id = taskId

        println("Adding task: \(task)")

        tasks.append(task)
    }

    func deleteTask(id: String) -> Int {
        var taskIndex = NSNotFound

        for var i = 0; i < tasks.count; i++ {
            if (tasks[i].id == id) {
                taskIndex = i
            }
        }

        if (taskIndex != NSNotFound) {
            tasks.removeAtIndex(taskIndex)
        }

        return taskIndex
    }

    func updateTask(task: Task) {
        for t in tasks {
            if (t.id == task.id) {
                t.summary = task.summary
                t.complete = task.complete
            }
        }
    }

    func getNextId() -> String {
        var maxId = 0

        for task in tasks {
            if let taskId = task.id {
                let taskIdInt = taskId.toInt()!
                if (taskIdInt > maxId) {
                    maxId = taskIdInt
                }
            }
        }

        return "\(maxId + 1)"
    }
}
