import XCTest
@testable import DemoApp

class AsyncMethodsTest: XCTestCase {
    
    var worker: Worker!
    
    override func setUp() {
        worker = Worker()
    }
    
    override func tearDown() {
        worker = nil
    }
    
    func testExample() {
        measure { worker.performABlockingTask() }
        XCTAssert(true)
    }
    
    func testExample2() {
        //given
        let promise = expectation(description: "Debe invocar closure")
        
        //when
        worker.performAnAsyncTask() {
            promise.fulfill()
        }
        
        //then
        wait(for:[promise], timeout: 5)
    }
}
