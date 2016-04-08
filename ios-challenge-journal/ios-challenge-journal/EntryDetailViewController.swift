//
//  EntryDetailViewController.swift
//  ios-challenge-journal
//
//  Created by Parker Donat on 4/8/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = self.entry {
            updateWithEntry(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.body = self.bodyTextView.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, body: self.bodyTextView.text)
            EntryController.sharedInstance.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        self.titleTextField.text = ""
        self.bodyTextView.text = ""
    }
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.body
    }
}
