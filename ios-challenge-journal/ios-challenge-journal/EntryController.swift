//
//  EntryController.swift
//  ios-challenge-journal
//
//  Created by Parker Donat on 4/8/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    let kEntries = "entries"
    
    var entries: [Entry] = []
    
    init() {
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        self.saveToPersistantStorage()
    }
    
    func removeEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
        self.saveToPersistantStorage()
    }
    
    func saveToPersistantStorage() {
        
    }
    
    func loadFromPersistentStorage() {
        
    }
    
    
}