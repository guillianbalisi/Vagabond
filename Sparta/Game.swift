//
//  Game.swift
//  Sparta
//
//  Created by Pedro Oliveira on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import Foundation

class Game: NSObject, NSCoding {
    private let id: String
    private var highscore_ids: [String]
    private var highscore_scores: [Int]
    private var items: [String]
    
    //MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObjectForKey("id") as! String
        self.highscore_ids = aDecoder.decodeObjectForKey("highscore_ids") as! [String]
        self.highscore_scores = aDecoder.decodeObjectForKey("highscore_scores") as! [Int]
        self.items = aDecoder.decodeObjectForKey("items") as! [String]
        //FINISH USER DEFAULTS
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(highscore_ids, forKey: "highscore_ids")
        aCoder.encodeObject(highscore_scores, forKey: "highscore_scores")
        aCoder.encodeObject(items, forKey: "items")
        //FINISH USER DEFAULTS
    }



    //MARK: - Class
    
    init(withId id: String,
        withIds ids: [String],
        withScores scores: [Int],
        withItems items: [String]) {
        self.id = id
        self.highscore_ids = ids
        self.highscore_scores = scores
        self.items = items
    }
    
    override init() {
        self.id = NSUUID().UUIDString
        self.highscore_ids = [String]()
        self.highscore_scores = [Int]()
        self.items = [String]()
    }
    
    func getId() -> String {
        return self.id
    }
    
    func addHighscore(id id: String, score: Int) -> Void {
        self.highscore_ids.append(id)
        self.highscore_scores.append(score)
        var highscores: [(String, Int)] = Array(Zip2Sequence(self.highscore_ids, self.highscore_scores))
        highscores.sortInPlace({ $0.1 > $1.1})
        self.highscore_ids = highscores.map({ $0.0 })
        self.highscore_scores = highscores.map({ $0.1 })
    }
    
    func getHighscores() -> [(String, Int)] {
        let highscores = Array(Zip2Sequence(self.highscore_ids, self.highscore_scores))
        return highscores
    }
    
    // changes the score of id by change
    func changeHighscore(id id: String, change: Int) -> Bool {
        let f = find(id)
        if f.0 {
            self.highscore_scores[f.1] += change
        }
        return f.0
    }
    
    func setHighscore(id id: String, change: Int) -> Bool {
        let f = find(id)
        if f.0 {
            self.highscore_scores[f.1] = change
        }
        return f.0
    }
    
    // Attempts to remove user with id
    // If no such user exists then return false
    // else remove and return true
    func removeUser(id id: String) -> Bool {
        let f = find(id)
        if f.0 {
            highscore_ids.removeAtIndex(f.1)
            highscore_scores.removeAtIndex(f.1)
        }
        return f.0
    }
    
    func setItems(items: [String]) -> Void {
        self.items = items
    }
    
    func getItems() -> [String] {
        return self.items
    }
    
    // Generates a list of random items and assigns it to items
    func generateItems(possible_items: [String]) -> Void {
        var choices = [Int]()
        while(choices.count <= 4) {
            let rand: Int = Int(arc4random_uniform(UInt32(possible_items.count)))
            if !choices.contains(rand) {
                choices.append(rand)
            }
        }
        self.items = [String]()
        for i in choices {
            self.items.append(possible_items[i])
        }
    }
    
    func toDictionary() -> (String, Dictionary<String, AnyObject>) {
        let dict: Dictionary<String, AnyObject> = [
            "highscores": [
                "ids": self.highscore_ids,
                "scores": self.highscore_scores
            ],
            "items": self.items
        ]
        return (self.id, dict)
    }
    
    static func fromDictionary(id: String, dict: Dictionary<String, AnyObject>) -> Game {
        let ids = dict["highscores"]!["ids"] as! [String]
        let scores = dict["highscores"]!["scores"] as! [Int]
        let items = dict["items"] as![String]
        let game = Game(withId: id,
                        withIds: ids,
                        withScores: scores,
                        withItems: items)
        return game
    }
    
    override var description: String {
        let highscores = Array(Zip2Sequence(self.highscore_ids, self.highscore_scores))
        return "\(self.id)\n\(highscores)\n\(items)"
    }
    
    private func find(id: String) -> (Bool, Int) {
        var index = -1
        let highscores = Array(Zip2Sequence(self.highscore_ids, self.highscore_scores))
        for (i, s) in highscores.enumerate() {
            if (s.0 == id ){
                index = i
                break;
            }
        }
        if index == -1 {
            return (false, index)
        } else {
            return (true, index)
        }
    }
}