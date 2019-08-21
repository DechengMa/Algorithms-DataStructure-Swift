// Challenge 2: print the middle node of a linked list
/*
 1 -> 2 -> 3 -> 4 -> nil
 middle is 3
 
 1 -> 2 -> 3 -> nil
 middle is 2
*/
func returnMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head
    
    // Runner's Technique
    // fast is 2 times faster than slow, so when fast reached the end, slow is at the middle of the list, then loop end, return the slow
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

example(of: "print the middle") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Original list: \(list)")
    print("Printing the middle")
    
    if let middleNode = returnMiddle(list) {
        print(middleNode)
    }
}

// Time complexity: O(n)
