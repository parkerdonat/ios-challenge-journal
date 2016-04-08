//
//  Entry.swift
//  ios-challenge-journal
//
//  Created by Parker Donat on 4/8/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kTitle = "title"
    private let kBody = "body"
    private let kTimeStamp = "timeStamp"
    
    var title: String
    var body: String
    var timeStamp = NSDate()
    
    var dictionaryCopy: [String: AnyObject] {
        return [kTitle: title, kBody: body, kTimeStamp: timeStamp]
    }
    
    init(title: String, body: String, timeStamp: NSDate = NSDate()) {
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let titleDictionary = dictionary[kTitle] as? String,
        bodyDictionary = dictionary[kBody] as? String,
        timeStampDictionary = dictionary[kTimeStamp] as? NSDate else { return nil }
        
        self.title = titleDictionary
        self.body = bodyDictionary
        self.timeStamp = timeStampDictionary
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
