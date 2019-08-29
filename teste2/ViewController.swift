//
//  ViewController.swift
//  teste2
//
//  Created by aluno on 28/08/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showText.text = "Hello, world!"
        listOfNotes.dataSource = self
        listOfNotes.delegate = self
        self.showText.layer.cornerRadius = 
        
        
    }
    
    var notes: [String] = ["jairoooo", "FUNCIONA, DIZGRAÇA"]
    @IBOutlet weak var textInput: UITextField!
    

    @IBAction func button(_ sender: UIButton) {
        self.showText.text = self.textInput.text
    }
    @IBOutlet weak var showText: UILabel!
    
    @IBOutlet weak var listOfNotes: UITableView!
    

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

