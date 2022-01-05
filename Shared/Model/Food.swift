//
//  Food.swift
//  Food
//
//  Created by Madhav Raj Verma on 29/11/21.
//

import Foundation



struct Foods :Codable {
    let foods:[Food]
}

struct SingleFood:Codable {
    let messgae:String
    let food:Food
}

struct Food :Codable {
    var _id : String
    var name:String
    var price:String
    var imageUrl:String
    var description:String
    var restaurant:String
    var restaurantname:String
    
}

