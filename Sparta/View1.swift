//
//  View1.swift
//  Sparta
//
//  Created by Guillian Balisi on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit
import ChameleonFramework

class View1: UIViewController {
    
    @IBOutlet weak var realHelloLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    var user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        topLabel.textColor = UIColor.whiteColor()
        topBackground.backgroundColor = FlatWatermelon()
        
        okButton.backgroundColor = FlatWatermelon()
        okButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        okButton.layer.borderWidth = 1
        okButton.layer.borderColor = FlatWatermelon().CGColor
        okButton.layer.cornerRadius = 6
        okButton.layer.masksToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressOK() {
        helloLabel.text = usernameTextField.text
        realHelloLabel.hidden = false
        helloLabel.hidden = false
        print("New user created")
        usernameTextField.text = ""
        viewTapped()
    }
    
    @IBAction func viewTapped() {
        usernameTextField.resignFirstResponder()
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
