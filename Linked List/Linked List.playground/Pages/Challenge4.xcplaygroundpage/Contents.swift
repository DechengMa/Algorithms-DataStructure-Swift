// Challenge 4: Merge two SORTED linked lists into one sorted linked list
/*
 // list1
 1 -> 4 -> 10 -> 11
 
 // list2
 -1 -> 2 -> 3 -> 6
 
 // expected result
 -1 -> 1 -> 2 -> 3 -> 4 -> 6 -> 10 -> 11
 
 */

func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else {
        return right
    }
    
    guard !right.isEmpty else {
        return left
    }
    
    var newHead: Node<T>?
    
    var tail: Node<T>?
    var currentLeft = left.head
    var currentRight = right.head
    
    // init the first
    if let leftNode = currentLeft,
        let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    // loop
    while let leftNode = currentLeft,
        let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                tail?.next = leftNode
                currentLeft = leftNode.next
            } else {
                tail?.next = rightNode
                currentRight = rightNode.next
            }
            
            tail = tail?.next
    }
    
    if let leftNodes = currentLeft {
        print("leftNodes \(leftNodes)")
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        print("rightNodes \(rightNodes)")
        tail?.next = rightNodes
    }
    
    var list = LinkedList<T>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    
    return list
}


example(of: "merging two lists") {
    var list = LinkedList<Int>()
    list.push(11)
    list.push(10)
    list.push(4)
    list.push(1)
    var anotherList = LinkedList<Int>()
    anotherList.push(6)
    anotherList.push(3)
    anotherList.push(2)
    anotherList.push(-1)
    print("First list: \(list)")
    print("Second list: \(anotherList)")
    let mergedList = mergeSorted(list, anotherList)
    print(mergedList)
}
