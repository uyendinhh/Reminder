//
//  ReminderViewController.swift
//  Reminder
//
//  Created by Uyen Dinh on 2/12/19.
//  Copyright © 2019 Uyen Dinh. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var reminders = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonWasPressed(_ sender: Any) {
        let alert = UIAlertController(title: "New Reminder", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Reminder"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {(_) in
            guard let reminderText = alert.textFields?.first?.text, !reminderText.isEmpty else {
                return
            }
             self.reminders.append(Reminder(text: reminderText, isCompleted: false))
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
}

extension ReminderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = reminder.text
        
        if reminder.isCompleted {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reminders[indexPath.row].toggle()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reminders.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
