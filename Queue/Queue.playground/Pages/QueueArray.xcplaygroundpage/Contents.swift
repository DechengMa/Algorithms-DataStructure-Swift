public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty // 1
    }
    
    public var peek: T? {
        return array.first // 2
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeLast()
    }
}


extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brain")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek

