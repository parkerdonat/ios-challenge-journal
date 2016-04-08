//
//  Entry.swift
//  ios-challenge-journal
//
//  Created by Parker Donat on 4/8/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    var body: String
    var timeStamp = NSDate()
    
    init(title: String, body: String, timeStamp: NSDate = NSDate()) {
    
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
