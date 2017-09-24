//
//  DetailViewController.swift
//  Todo List
//
//  Created by Jimmy McDermott on 9/20/17.
//  Copyright © 2017 162 LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var toDoField: UITextField!
    @IBOutlet private weak var saveBarButton: UIBarButtonItem!
    @IBOutlet private weak var todoNoteView: UITextView!
    
    //MARK: - Properties
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            todoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    
    private func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = todoNoteView.text
        }
    }
    
    @IBAction private func textFieldEditingChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction private func cancelTapped(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
