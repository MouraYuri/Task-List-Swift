//
//  NoteCD+CoreDataProperties.swift
//  teste2
//
//  Created by aluno on 30/08/19.
//  Copyright © 2019 aluno. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteCD> {
        return NSFetchRequest<NoteCD>(entityName: "NoteCD")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?

}
