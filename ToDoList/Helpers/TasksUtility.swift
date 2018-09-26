//
//  TasksUtility.swift
//  ToDoList
//
//  Created by Celal Aslan on 2018-09-24.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation

class TasksUtility {
    
    private static let key = "tasks"
    
    // archive
    private static func archive(_ tasks: [[Task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: tasks) as NSData
    }
    
    // fetch
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
    }
    
    // save
    static func save(_ tasks: [[Task]]) {
        
        // Archive
        let archivedTasks = archive(tasks)
        
        // Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
        
        
    }
}
