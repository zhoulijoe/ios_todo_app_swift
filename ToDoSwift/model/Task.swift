class Task: Printable {
    var id: String?
    var summary: String?
    var complete: Bool

    init(id: String?, summary: String) {
        self.id = id
        self.summary = summary
        self.complete = false
    }

    var description: String {
        return "Printable {" +
        "id: \(id), " +
        "summary: \(summary), " +
        "complete: \(complete)}"
    }
}