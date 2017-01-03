//
//  Item.swift
//  SwiftJSONLibsPerformance
//
//  Created by Anton Davydov on 27/12/2016.
//  Copyright © 2016 dydus. All rights reserved.
//

import Freddy
import ObjectMapper
import Unbox
import Marshal

class Friend: JSONDecodable, Mappable, Unboxable, Unmarshaling {
    var ID: Int!
    var name: String!
    
    init() { }
    
    // Freddy
    required init(json value: JSON) throws {
        ID = try value.getInt(at: "id")
        name = try value.getString(at: "name")
    }
    
    // ObjectMapper
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        ID <- map["id"]
        name <- map["name"]
    }
    
    // Unbox
    required init(unboxer: Unbox.Unboxer) throws {
        ID = try unboxer.unbox(key: "id")
        name = try unboxer.unbox(key: "name")
    }
    
    // Marshal
    required init(object: MarshaledObject) throws {
        ID = try object.value(for: "id")
        name = try object.value(for: "name")
    }
}


class Item: JSONDecodable, Mappable, Unboxable, Unmarshaling {
    var ID: String!
    var index: Int!
    var guid: String!
    var isActive: Bool!
    var age: Int!
    var eyeColor: String!
    var name: String!
    var gender: String?
    var email: String!
    var phone: String!
    var tags: [String]!
    var latitude: Double!
    var longitude: Double!
    var friends: [Friend]!
    
    init() {}
    
    // Freddy
    required init(json value: JSON) throws {
        ID = try value.getString(at: "_id")
        index = try value.getInt(at: "index")
        isActive = try value.getBool(at: "isActive")
        guid = try value.getString(at: "guid")
        age = try value.getInt(at: "age")
        eyeColor = try value.getString(at: "eyeColor")
        name = try value.getString(at: "name")
        gender = try? value.getString(at: "gender")
        email = try value.getString(at: "email")
        phone = try value.getString(at: "phone")
        longitude = try value.getDouble(at: "geolocation","longitude")
        latitude = try value.getDouble(at: "geolocation","latitude")
        tags = try value.decodedArray(at: "tags", type: String.self)
        friends = try value.decodedArray(at: "friends", type: Friend.self)
    }
    
    // ObjectMapper
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        ID <- map["_id"]
        index <- map["index"]
        isActive <- map["isActive"]
        guid <- map["guid"]
        age <- map["age"]
        eyeColor <- map["eyeColor"]
        name <- map["name"]
        gender <- map["gender"]
        email <- map["email"]
        phone <- map["phone"]
        longitude <- map["geolocation.longitude"]
        latitude <- map["geolocation.latitude"]
        tags <- map["tags"]
        friends <- map["friends"]
    }
    
    // Unbox
    required init(unboxer: Unbox.Unboxer) throws {
        ID = try unboxer.unbox(key: "_id")
        index = try unboxer.unbox(key: "index")
        isActive = try unboxer.unbox(key: "isActive")
        guid = try unboxer.unbox(key: "guid")
        age = try unboxer.unbox(key: "age")
        eyeColor = try unboxer.unbox(key: "eyeColor")
        name = try unboxer.unbox(key: "name")
        gender = unboxer.unbox(key: "gender")
        email = try unboxer.unbox(key: "email")
        phone = try unboxer.unbox(key: "phone")
        longitude = try unboxer.unbox(keyPath: "geolocation.longitude")
        latitude = try unboxer.unbox(keyPath: "geolocation.latitude")
        tags = try unboxer.unbox(key: "tags")
        friends = try unboxer.unbox(key: "friends")
    }
    
    // Marshal
    required init(object: MarshaledObject) throws {
        ID = try object.value(for: "_id")
        index = try object.value(for: "index")
        isActive = try object.value(for: "isActive")
        guid = try object.value(for: "guid")
        age = try object.value(for: "age")
        eyeColor = try object.value(for: "eyeColor")
        name = try object.value(for: "name")
        gender = try? object.value(for: "gender")
        email = try object.value(for: "email")
        phone = try object.value(for: "phone")
        longitude = try object.value(for: "geolocation.longitude")
        latitude = try object.value(for: "geolocation.latitude")
        tags = try object.value(for: "tags")
        friends = try object.value(for: "friends")
    }
}
