//
//  ViewControllerII.swift
//  teste2
//
//  Created by aluno on 02/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation
import UIKit

protocol AddNoteDelegate: class {
    func didMoveToController(title: String, description: String)
}

class ViewControllerII: UIViewController,
    UITextFieldDelegate{
    
    weak var delegate: AddNoteDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var saveNoteButton: UIButton!
    
    @IBAction func saveNoteButtonAction(_ sender: UIButton) {
        delegate?.didMoveToController(title: self.titleTextInputOutlet.text!, description: self.descriptionTextInputOutlet.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var descriptionTextInputOutlet: UITextField!
    
    @IBOutlet weak var titleTextInputOutlet: UITextField!
}
