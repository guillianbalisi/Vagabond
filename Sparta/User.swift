//
//  User.swift
//  Sparta
//
//  Created by Guillian Balisi on 2016-02-28.
//  Copyright © 2016 Sparta. All rights reserved.
//

import Foundation

class User {
    //var userName: String
    var score: Int
    
    init() {
        //self.userName = userName
        self.score = 0
    }
    
    init(string: Int) {
        print("hello")
        self.score = 0
    }
    
    // MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        //self.userName = aDecoder.decodeObjectForKey("userName") as! String
        self.score = aDecoder.decodeObjectForKey("score") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        //aCoder.encodeObject(userName, forKey: "userName")
        aCoder.encodeObject(score, forKey: "score")
    }
    
}
