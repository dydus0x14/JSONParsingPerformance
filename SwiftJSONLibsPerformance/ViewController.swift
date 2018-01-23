//
//  ViewController.swift
//  SwiftJSONLibsPerformance
//
//  Created by Anton Davydov on 23/12/2016.
//  Copyright © 2016 dydus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "five_megs", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        var time = measure { validateWithBender(data) }
        print("Bender \(time) ms")
        
        time = measure { validateWithConcurrentBender(data) }
        print("Concurrent Bender \(time) ms")
        
        time = measure { validateWithFreddy(data) }
        print("Freddy \(time) ms")
        
        time = measure { validateWithObjectMapper(data) }
        print("Object Mapper \(time) ms")
        
        time = measure { validateWithObjectUnbox(data) }
        print("Unbox \(time) ms")
        
        time = measure { validateWithMarshal(data) }
        print("Marshal \(time) ms")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func measure(problemBlock: ()->Void) -> Double {
    let start = DispatchTime.now()
    problemBlock()
    let end = DispatchTime.now()
    
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    return Double(nanoTime) / 1_000_000_000
}
