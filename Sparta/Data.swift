//
//  Data.swift
//  Sparta
//
//  Created by Pedro Oliveira on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import Foundation
import Firebase

class Data {
    static let url = "https://flickering-heat-8844.firebaseio.com"
    static let firebase = Firebase(url: url)
    static let games = firebase.childByAppendingPath("Games")
    static let users = firebase.childByAppendingPath("Users")
    static let items = firebase.childByAppendingPath("Items")
    static let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    static func addGame(game: Game) {
        let dict = game.toDictionary()
        games.updateChildValues([dict.0: dict.1])
    }
    static func getGame(id: String) -> Game {
        let games = appDelegate.data!["Games"] as! Dictionary<String, AnyObject>
        let game = games[id] as! Dictionary<String, AnyObject>
        return Game.fromDictionary(id, dict: game)
    }
    static func removeGame(id: String) {
        games.childByAppendingPath(id).removeValue()
    }
    static func addScore(game: Game, score: (id: String, score: Int)) {}
    static func updateScore(game: Game, score: (id: String, score: Int)) {}
    
    
}