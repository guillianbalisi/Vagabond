//
//  ViewController.swift
//  Sparta
//
//  Created by Pedro Oliveira on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    var tagList : [String] = []
<<<<<<< HEAD
    var user = User()
=======
>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
    
    let tags = ["dark", "bottle", "pencil", "desktop", "trash", "apple", "banana", "door", "cloud", "people", "audience", "chairs", "boy", "tired", "blurred", "dim", "screen", "wall", "shoes", "shirt", "elephant", "floor", "dog", "computer", "laptop", "pencil", "beautiful", "still life", "tasty", "sweet", "business", "pizza", "angry", "black", "yellow", "orange", "wallet", "chair", "youthful", "crate", "poster", "fun", "leather", "old", "empty", "fashion", "retro", "vintage", "card", "space", "sky", "evening", "tree", "school", "education", "glossy", "moon", "wall", "architecture", "indoors", "modern", "internet", "wireless", "World Wide Web", "safety", "electronics", "interior design", "entrance", "stone", "hallway", "fun", "fast", "contemporary", "abstract", "retro", "adult", "girl", "reflection", "shadow", "light", "man", "iron", "steel", "no person", "luxury", "eclipse", "astronomy", "bright", "broom", "clean", "tool", "dust", "housework", "wooden", "security", "fur", "nature", "cute", "mammal", "wild", "shadow", "Halloween", "no person", "insect", "biology", "recreation", "tropical", "fruit", "lemon", "chili", "spice", "hot", "warm", "bag", "phone", "cellphone", "closeup", "blooming", "single", "smile", "laugh", "teeth", "happy", "laughing", "sad", "wheel", "circle", "square", "triangle", "rectangle", "pyramid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Set up view
        
        let v1 : View1 = View1(nibName: "View1", bundle: nil)
        let v2 : View2 = View2(nibName: "View2", bundle: nil)
        let v3 : View3 = View3(nibName: "View3", bundle: nil)
        let v4 : View4 = View4(nibName: "View4", bundle: nil)
        
        self.addChildViewController(v1)
        self.scrollView.addSubview(v1.view)
        v1.didMoveToParentViewController(self)
        
        self.addChildViewController(v2)
        self.scrollView.addSubview(v2.view)
        v2.didMoveToParentViewController(self)
        
        self.addChildViewController(v3)
        self.scrollView.addSubview(v3.view)
        v3.didMoveToParentViewController(self)
        
        self.addChildViewController(v4)
        self.scrollView.addSubview(v4.view)
        v4.didMoveToParentViewController(self)
        
        var v2Frame : CGRect = v2.view.frame
        v2Frame.origin.x = self.view.frame.width
        v2.view.frame = v2Frame
        
        var v3Frame : CGRect = v3.view.frame
        v3Frame.origin.x = self.view.frame.width * 2
        v3.view.frame = v3Frame
        
        var v4Frame : CGRect = v4.view.frame
        v4Frame.origin.x = self.view.frame.width * 3
        v4.view.frame = v4Frame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 4, self.view.frame.height)
        let offset : CGPoint = CGPointMake(self.view.frame.width, self.view.frame.height)
        self.scrollView.setContentOffset(offset, animated: true)
        
        //MARK: - Load data
        generateTags()
        print("VC")
        print(tagList)
        v2.tagList = tagList
        v3.tagList = tagList
<<<<<<< HEAD
        v2.user = user
=======
>>>>>>> 91d41882cc7faa7f134f2c10cae0b010ccdaa1b8
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateTags() {
        for i in 0...15 {
            let randomIndex = Int(arc4random_uniform(UInt32(tags.count)))
            tagList.append(tags[randomIndex])
        }
        print(tagList)
    }
    
    
}

