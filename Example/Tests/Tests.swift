import XCTest
import KESwiftExtensions

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - KESwiftExtensions tests
    func test_roundViewWidth() {
        let imageView = UIImageView()
        imageView.roundViewWith(borderColor: UIColor.red, borderWidth: 3.0)
        
        //The message provide description for failure.
        //To simulate failure, choose incorrect width below, e.g. 2.0
        XCTAssert(imageView.layer.borderWidth == 3.0, "UIImageView extension roundViewWith: method failed!")
    }
    
}
