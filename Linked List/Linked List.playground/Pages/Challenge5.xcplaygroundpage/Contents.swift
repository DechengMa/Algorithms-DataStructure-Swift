// Challenge 5: remove all occurances of an element
/*
 
 1 -> 3 -> 3 -> 3 -> 4
 remove 3, to
 1 -> 4
 
 */
extension LinkedList where Value: Equatable {
    mutating func removeAll(_ value: Value) {
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
        
        tail = prev
    }
}

example(of: "deleting duplicate nodes") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(1)
    
    list.removeAll(1)
    print(list)
}
