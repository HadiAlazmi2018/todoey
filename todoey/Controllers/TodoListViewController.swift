//
//  ViewController.swift
//  todoey
//
//  Created by hadi alazmi on 5/27/18.
//  Copyright © 2018 hadi alazmi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
      if let items = defaults.array(forKey: "todoLsitArray") as? [Item] {
           itemArray = items
       }
        
       
    }

    //MARK - tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        // value = condition ? value if True : valueFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFeild = UITextField()
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user click the add item button on our UIalert
            
            let newItem = Item()
            
            newItem.title = textFeild.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "todoLsitArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Creat new Item"
           textFeild = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

