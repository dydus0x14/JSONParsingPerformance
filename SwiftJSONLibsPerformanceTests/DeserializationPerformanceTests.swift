//
//  SwiftJSONLibsPerformanceTests.swift
//  SwiftJSONLibsPerformanceTests
//
//  Created by Anton Davydov on 23/12/2016.
//  Copyright © 2016 dydus. All rights reserved.
//

import XCTest
import Bender
import Freddy
import ObjectMapper
import Unbox
import Marshal

class DeserializationPerformanceTests: XCTestCase {
    
    var data: Data!
    
    override func setUp() {
        super.setUp()
        
        let path = Bundle(for: DeserializationPerformanceTests.self)
            .path(forResource: "five_megs", ofType: "json")!
        data = try! Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    func testPerformanceBender() {
        measure {
            validateWithBender(self.data)
        }
    }
    
    func testPerformanceConcurrentBender() {
        measure {
            validateWithConcurrentBender(self.data)
        }
    }
    
    func testPerformanceFreddy() {
        measure {
            validateWithFreddy(self.data)
        }
    }
    
    func testPerformanceObjectMapper() {
        measure {
            validateWithObjectMapper(self.data)
        }
    }
    
    func testPerformanceObjectUnbox() {
        measure {
            validateWithObjectUnbox(self.data)
        }
    }
    
    func testPerformanceObjectMarshal() {
        measure {
            validateWithMarshal(self.data)
        }
    }
}
