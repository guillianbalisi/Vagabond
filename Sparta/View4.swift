//
//  View4.swift
//  Sparta
//
//  Created by Guillian Balisi on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit
import ChameleonFramework


class View4: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        topLabel.textColor = UIColor.whiteColor()
        topBackground.backgroundColor = FlatWatermelon()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
