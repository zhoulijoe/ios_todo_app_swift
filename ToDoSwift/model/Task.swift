class Task {
    let id: String
    var description: String?
    var complete: Bool

    init(id: String, description: String) {
        self.id = id
        self.description = description
        self.complete = false
    }
}