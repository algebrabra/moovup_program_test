import UIKit

//Question 1a
//Define the node list
let nodes: [String: Array<String>] = [
    "A": ["B", "D", "H"],
    "B": ["A", "C", "D"],
    "C": ["B", "D", "F"],
    "D": ["A", "B", "C", "E"], 
    "E": ["D", "F", "H"],
    "F": ["C", "E", "G"],
    "G": ["F", "H"],
    "H": ["A", "E", "G"]]

//Function to find all path
func find_all_path(nodes: [String: Array<String>], from: String, to: String, currentPath: [String] = []) -> [[String]] {
    var all_path = [[String]]()
    var path = currentPath
    path.append(from)
    nodes[from]?.forEach({ node in
        if !path.contains(node) { //Check for duplicate node
            if node == to { //Arrive destination, then finish and return
                path.append(node)
                all_path.append(path)
            } else { //Move to next non duplicate node
                let new_paths = find_all_path(nodes: nodes, from: node, to: to, currentPath: path)
                all_path.append(contentsOf: new_paths)
            }
        }
    })
    return all_path
}

let all_path = find_all_path(nodes: nodes, from: "A", to: "H")
print("1a. There are \(all_path.count) path(s)")
all_path.forEach { path in
    print(path.joined(separator: "->"))
}

print("\n")
//Question 1b
if all_path.count > 0 {
    var shortest_path = all_path[0]
    all_path.forEach { path in //Loop for all path
        if path.count < shortest_path.count { //Replace shortest if have
            shortest_path = path
        }
    }
    print("1b. Shortest path is \(shortest_path.joined(separator: "->"))")
}
