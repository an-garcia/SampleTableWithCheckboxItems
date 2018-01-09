//
//  ViewController.swift
//  SampleTableWithCheckboxItems
//
//  Created by xengar on 2018-01-09.
//  Copyright © 2018 xengar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    struct Option {
        let name : String
        var enabled : Bool
        
        init(_ name : String, _ enabled : Bool) {
            self.name = name
            self.enabled = false
        }
    }
    
    var languages : [Option] = [Option]() // list of options
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create the Options
        for index in 1...50 {
            languages.append(Option("language \(index)", false))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// MARK: - ViewController (Table Data Source)
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")! as! UITableViewCell
        let laguage = languages[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = laguage.name
        cell.accessoryType = laguage.enabled ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // mark the cell
        if self.tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.none {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        
        // save the value in the array
        let index = (indexPath as NSIndexPath).row
        languages[index].enabled = !languages[index].enabled
    }
}
