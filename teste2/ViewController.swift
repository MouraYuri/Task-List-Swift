import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            self.showText.text = "Hello, world!"
            listOfNotes.dataSource = self
            listOfNotes.delegate = self
            self.buttonOutlet.layer.cornerRadius = 15
            try DataController.shared.insertNote()
            self.CDNotes = try DataController.shared.readNotes()
            
        }catch{
            print("An error has ocurred")
        }
        
        
        
    }
    var CDNotes: [NoteCD] = []
    var notes: [String] = ["jairoooo", "FUNCIONA, DIZGRAÇA"]
    var notesObj: [Note] = []
    @IBOutlet weak var textInput: UITextField! //text input component
    

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBAction func button(_ sender: UIButton) { //on click button
        self.showText.text = self.textInput.text
        self.notes.append(self.textInput.text!)
        self.listOfNotes.reloadData() //refreshing the tableView
        let newNote = Note(noteContent: self.textInput.text!, noteDate: Date()) //creating a new note object that has content and date
        notesObj.append(newNote) //adding new note to the note array
        do {
            try DataController.shared.insertNote()
        }catch {
            print("An error has ocurred!!")
        }
        
    }
    @IBOutlet weak var showText: UILabel! 
    
    @IBOutlet weak var listOfNotes: UITableView! //tableView outlet
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for:indexPath)
        let text = notes[indexPath.row]
        cell.textLabel?.text = text
        return cell
        
    }
    
    
    
}

