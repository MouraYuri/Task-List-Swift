//
//  File.swift
//  teste2
//
//  Created by aluno on 29/08/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation
struct Defaults {
    
    static let (noteKey, dateKey) = ("note", "date")
    static let userSessionKey = "com.save.usersession"
    
    struct Model {
        var note: String
        var date: String
        
        init(_ json: [String: String]) {
            self.note = json[noteKey] ?? ""
            self.date = json[dateKey] ?? ""
        }
    }
    
    static func save(_ note: String, with date: String){
        UserDefaults.standard.set([noteKey: note, dateKey: date], forKey: userSessionKey)
    }
    
    static func getNoteAndDate()-> Model {
        return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
}
