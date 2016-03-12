//
//  View3.swift
//  Sparta
//
//  Created by Guillian Balisi on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit
import ChameleonFramework

<<<<<<< HEAD
=======

>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
class View3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
<<<<<<< HEAD
    //@IBOutlet weak var realTableCell: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    
    var tagList : [String] = []
    
    
=======
    @IBOutlet weak var CustomCell: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var tagList : [String] = []

>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("View3")
        print(tagList)
<<<<<<< HEAD
        
        let nib = UINib(nibName: "RealTableCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: "Real")
        tableView.reloadData()
        scoreLabel.text = String(AppDelegate.score)
        
=======
        tableView.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        // Do any additional setup after loading the view.
>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
    }
    
    override func viewWillAppear(animated: Bool) {
        topLabel.textColor = UIColor.whiteColor()
        topBackground.backgroundColor = FlatWatermelon()
        scoreLabel.textColor = FlatWatermelon()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
<<<<<<< HEAD
        return tagList.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : RealTableCell = self.tableView.dequeueReusableCellWithIdentifier("Real") as! RealTableCell

        cell.tagLabel.text = tagList[indexPath.row]
        
=======
        return tagList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        cell.tagLabel.text = tagList[indexPath.row]

>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
        return cell
    }

    
    
}
