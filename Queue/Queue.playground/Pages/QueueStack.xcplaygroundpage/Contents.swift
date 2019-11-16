// Queuestack
/*
 
 Whenever you enqueue an element, it goes in the right stack
 
 When dequeue, you reverse the right stack and place it in the left stack so that you can retrieve the element using FIFO order
 
 */

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: QueueStack<T>.Element) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let printList = leftStack.reversed() + rightStack
        return String(describing: printList)
    }
}

var queue = QueueStack<String>()
queue.enqueue("Ray")
queue.enqueue("Brain")
queue.enqueue("Eric")
queue
queue
