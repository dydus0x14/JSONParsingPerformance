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
            let _ = try? itemsRule.validateData(self.data)
        }
    }
    
    func testPerformanceFreddy() {
        measure {
            let json = try! JSON(data: self.data)
            let _ = try! json.decodedArray(alongPath: .nullBecomesNil, type: Item.self)
        }
    }
    
    func testPerformanceObjectMapper() {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as AnyObject
        measure {
            let _ = Mapper<Item>().mapArray(JSONObject: json)
        }
    }
    
    func testPerformanceObjectUnbox() {
        measure {
            let _: [Item] = try! unbox(data: self.data)
        }
    }
    
    func testPerformanceObjectMarshal() {
        measure {
            let _: [Item] = try! JSONParser.JSONArrayWithData(self.data).map{ try! Item(object: $0) }
        }
    }
}
