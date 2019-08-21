// Challenge 3: Reverse a list
/*
 
  1 -> 2 -> 3 -> nil
  to
  3 -> 2 -> 1 -> nil
 
*/

// Solution 1
func reverseListOne<T>(_ list: LinkedList<T>) -> LinkedList<T>? {
    var newList = LinkedList<T>()
    
    for value in list {
        newList.push(value)
    }
    
    return newList
}

// Solution 2
extension LinkedList {
    mutating func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            
            prev = current
            current = next
        }
        head = prev
    }
}

example(of: "reverse the list") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    print("Original list: \(list)")
    
    if let list = reverseListOne(list) {
        print("Reversed List: \(list)")
    }
}

example(of: "reverse the list function 2") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    print("Original list: \(list)")
    
    list.reverse()
    print("Reversed List: \(list)")
}
