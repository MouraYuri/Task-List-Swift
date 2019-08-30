import Foundation
import CoreData

class DataController {
    
    static let shared = DataController()
    
    private init() {}
    
    // Creating an instance of NSPersistentContainer for  a designed DATA MODEL
    let persistentContainer = NSPersistentContainer(name: "NoteModel")
    
    
    var context: NSManagedObjectContext {  //context variable that we can use to do operation
        return self.persistentContainer.viewContext
    }

    func initalizeStack() {
    //invoke initialization calling loadPersistentStores method
    self.persistentContainer.loadPersistentStores { description, error in
        // check if the operations was finished successfully
        if let error = error {
            print("could not load store \(error.localizedDescription)")
            return
        }
        
        print("store loaded")
    }
    }
    
    func insertNote(note: Note) throws{
        let noteToBeSaved = NoteCD(context: self.context)
        noteToBeSaved.content = note.noteContent
        noteToBeSaved.date = NSDate()
        self.context.insert(noteToBeSaved)
        try self.context.save()
    }
    func insertNote() throws{
        let noteToBeSaved = NoteCD(context: self.context)
        noteToBeSaved.content = "FUNCIONA, DIZGRAÇA"
        noteToBeSaved.date = NSDate()
        self.context.insert(noteToBeSaved)
        try self.context.save()
    }
    
    func readNotes() throws -> [NoteCD] {
        let notes = try self.context.fetch(NoteCD.fetchRequest() as NSFetchRequest<NoteCD>)
        return notes
    }
    
}

