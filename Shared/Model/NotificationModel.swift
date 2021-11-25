//
//  NotificationModel.swift
//  NotificationModel
//
//  Created by Madhav Raj Verma on 25/11/21.
//

import Foundation


struct  NotificationModel:Identifiable {
    var id = UUID()
    let image :String
    let title:String
    let date:Date
}


let notifications =  [
NotificationModel(image: "checked", title: "Your Order has been taken by the driver", date: Date()),
NotificationModel(image: "money", title: "Topup For $100 was successful", date: Date()),
NotificationModel(image: "cancelOrder", title: "Your Order has been Canceled", date: Date())

]
