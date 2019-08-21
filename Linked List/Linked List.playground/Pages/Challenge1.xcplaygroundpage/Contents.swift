// Challenges
// Challenge 1: prints out the elements of a linked list in reverse order

func printInReverse<T>(_ list: LinkedList<T>) {
    printInReverse(list.head)
}

private func printInReverse<T>(_ node: Node<T>?) {
    // if node.next isn't exist, jump out of the function, print the out lastest node
    // otherwise, recursive calling the function till the end of the list
    guard let node = node else {
        return
    }
    
    printInReverse(node.next)
    print(node.value)
}

example(of: "print in reverse") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Original list: \(list)")
    print("Printing in reverse")
    printInReverse(list)
}

// Time complexity: O(n)
