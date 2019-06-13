//
//  PromiseKitTests.swift
//  DemoAppTests
//
//  Created by Jose Carreno on 6/13/19.
//  Copyright © 2019 Jose Carreno. All rights reserved.
//

import XCTest
import PromiseKit
@testable import DemoApp

class PromiseKitTests: XCTestCase {
    
    var promiseWorker: PromiseWorker!
    
    override func setUp() {
        promiseWorker = PromiseWorker()
    }
    
    override func tearDown() {
        promiseWorker = nil
    }
    
    func testExample() {
        var productosRecuperados: [PromiseWorker.Producto]? = nil
        let testPromise = expectation(description: "Debe recuperar productos")
        
        self.promiseWorker.recuperarProductos().done { productos in
            productosRecuperados = productos
            testPromise.fulfill()
        }
        
        wait(for: [testPromise], timeout: 2)
        XCTAssertNotNil(productosRecuperados)
    }
}
