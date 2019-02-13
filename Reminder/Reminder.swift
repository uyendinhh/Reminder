//
//  Reminder.swift
//  Reminder
//
//  Created by Uyen Dinh on 2/12/19.
//  Copyright © 2019 Uyen Dinh. All rights reserved.
//

import Foundation

struct Reminder {
    let text: String
    var isCompleted: Bool
    
    mutating func toggle() {
        isCompleted = !isCompleted;
    }
    
}
