//
//  Worker.swift
//  DemoApp
//
//  Created by Jose Carreno on 6/12/19.
//  Copyright © 2019 Jose Carreno. All rights reserved.
//

import Foundation

class Worker {
    
    func performABlockingTask() {
        usleep(1000000)
    }
    
    func performAnAsyncTask(closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.performABlockingTask()
            closure()
        }
    }
}
