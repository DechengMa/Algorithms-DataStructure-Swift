// Challenge 1: print a linked list in reverse without using recursion

func printInReverse<T>(_ list: LinkedList<T>) {
    var current = list.head
    var stack = Stack<T>()
    
    while let node = current {
        stack.push(node.value)
        current = node.next
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

// Time complexity: O(n)
