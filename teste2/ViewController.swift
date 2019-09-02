import UIKit


class ViewController: UIViewController, UITextFieldDelegate{
    
//    var addNoteVC: ViewControllerII?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addNoteVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerII") as! ViewControllerII
        
        
    }
    
    var CDNotes: [NoteCD] = []
    var notes: [String] = ["jairoooo", "FUNCIONA, DIZGRAÇA"]
    var notesObj: [Note] = []
    
    @IBOutlet weak var listOfNotes: UITableView! //tableView outlet
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ViewControllerII {
            destination.delegate = self
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOfNotes.reloadData()
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource, AddNoteDelegate {
    
    func didMoveToController(title: String, description: String) {
        self.notes.append(title)
        self.listOfNotes.reloadData()
    }
    
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

