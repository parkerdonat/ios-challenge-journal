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
        var entryDictionaryArray: [[String: AnyObject]] = []
        for entry in entries {
            let entryDictionary = entry.dictionaryCopy
            entryDictionaryArray.append(entryDictionary)
        }
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaryArray, forKey: kEntries)
    }
    
    func loadFromPersistentStorage() {
        if let entryDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as? [[String: AnyObject]] {
            var entriesArray: [Entry] = []
            for entryDictionary in entryDictionaryArray {
                if let entry = Entry(dictionary: entryDictionary) {
                    entriesArray.append(entry)
                }
            }
            self.entries = entriesArray
        }
    }
}