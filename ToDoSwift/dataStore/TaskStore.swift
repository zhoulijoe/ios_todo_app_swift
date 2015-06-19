class TaskStore {
    static let sharedInstance = TaskStore()

    // List of current tasks
    var tasks: [Task]

    init() {
        tasks = TaskStore.createMockTasks()
    }

    class func createMockTasks() -> [Task] {
        return [
            Task(id: "1", description: "Learn Swift"),
            Task(id: "2", description: "Buy milk"),
            Task(id: "3", description: "Feed cat")
        ]
    }

    func addTask(task: Task) {
        tasks.append(task)
    }

    func updateTask(task: Task) {
        for t in tasks {
            if (t.id == task.id) {
                t.description = task.description
                t.complete = task.complete
            }
        }
    }
}
