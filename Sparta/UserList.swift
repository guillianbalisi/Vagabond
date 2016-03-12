////
////  UserList.swift
////  Sparta
////
////  Created by Guillian Balisi on 2016-02-28.
////  Copyright © 2016 Sparta. All rights reserved.
////
//
//import Foundation
//
//class UserList {
//    var userNameList = [String]()
//    var userScoreList = [Int]()
//    
//    init() {
//        self.userNameList = []
//        self.userScoreList = []
//    }
//    
//    func add(user: User) {
//        self.userNameList.append(user.userName)
//        self.userScoreList.append(user.score)
//    }
//    
//    func sort() {
//        let array = zip(userNameList,userScoreList).sort {$0.0 < $1.0}
//        self.userNameList = array.map {$0.0}
//        self.userScoreList = array.map {$0.1}
//    }
//    
//    // MARK: - NSCoding
//    
//    required init?(coder aDecoder: NSCoder) {
//        self.userNameList = aDecoder.decodeObjectForKey("userNameList") as! [String]
//        self.userScoreList = aDecoder.decodeObjectForKey("userScoreList") as! [Int]
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(userNameList, forKey: "userNameList")
//        aCoder.encodeObject(userScoreList, forKey: "userScoreList")
//    }
//}