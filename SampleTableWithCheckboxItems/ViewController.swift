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
    
    let languages = ["language 1", "language 2", "language 3", "language 4", "language 5", "language 6", "language 7", "language 8", "language 9", "language 10", "language 11", "language 12", "language 13", "language 14", "language 15"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        cell.textLabel!.text = laguage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected verb
        let laguage = languages[(indexPath as NSIndexPath).row]
        
        // Get a controller from the Storyboard
        //let controller = self.storyboard!.instantiateViewController(withIdentifier: "VerbDetailsViewController")as! VerbDetailsViewController
        
        // Set the verb data
        //controller.verb = verb
        
        // Push the new controller onto the stack
        //self.navigationController!.pushViewController(controller, animated: true)
    }
}
