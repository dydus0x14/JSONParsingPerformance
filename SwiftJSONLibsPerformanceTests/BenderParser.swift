//
//  BenderParser.swift
//  SwiftJSONLibsPerformance
//
//  Created by Anton Davydov on 27/12/2016.
//  Copyright © 2016 dydus. All rights reserved.
//

import Bender

let friendRule = ClassRule(Friend())
    .expect("id", IntRule, { $0.ID = $1 })
    .expect("name", StringRule, { $0.name = $1 })

let itemRule = ClassRule(Item())
    .expect("_id", StringRule, { $0.ID = $1 })
    .expect("index", IntRule, { $0.index = $1 })
    .expect("guid", StringRule, { $0.guid = $1 })
    .expect("isActive", BoolRule, { $0.isActive = $1 })
    .expect("age", IntRule, { $0.age = $1 })
    .expect("eyeColor", StringRule, { $0.eyeColor = $1 })
    .expect("name", StringRule, { $0.name = $1 })
    .optional("gender", StringRule, { $0.gender = $1 })
    .expect("email", StringRule, { $0.email = $1 })
    .expect("phone", StringRule, { $0.phone = $1 })
    .expect("tags", ArrayRule(itemRule: StringRule), { $0.tags = $1 })
    .expect("geolocation"/"latitude", DoubleRule, { $0.latitude = $1 })
    .expect("geolocation"/"longitude", DoubleRule, { $0.longitude = $1 })
    .expect("friends", ArrayRule(itemRule: friendRule), { $0.friends = $1 })

let itemsRule = ArrayRule(itemRule: itemRule)

    
