/*
 Print all the values in a tree in an order based on their level. Nodes belonging in the same level should be printed in the same line.
 
 Example:
 15
 1 17 20
 1 5 0 2 5 7
 */

func printEachLevel<T>(for tree: TreeNode<T>) {
    
    var queue = Queue<TreeNode<T>>()
    var nodesLeftInCurrentLevel = 0
    queue.enqueue(tree)
    
    while !queue.isEmpty {
        
        nodesLeftInCurrentLevel = queue.count
        print(queue.count)
        
        while nodesLeftInCurrentLevel > 0 {
            guard let node = queue.dequeue() else { break }
            print("\(node.value) ", terminator: "")
            node.children.forEach { queue.enqueue($0) }
            nodesLeftInCurrentLevel -= 1
        }
        
        print()
    }
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

example(of: "Challenge") {
    let treeNodes = makeBeverageTree()
    printEachLevel(for: treeNodes)
}
