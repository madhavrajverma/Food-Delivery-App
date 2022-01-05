//
//  Restaurant.swift
//  Restaurant
//
//  Created by Madhav Raj Verma on 29/11/21.
//

import Foundation


struct Restaurants :Codable {
    let message:String
    let restaurants:[Restaurant]
}

struct SingleRestaurant:Codable {
    let messgae:String
    let restaurant:Restaurant
}

struct Restaurant :Codable {
  
    var _id : String
    var name:String
    var reslogo:String
    var resimage:String
    var rating:String
}




