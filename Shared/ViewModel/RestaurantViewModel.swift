//
//  RestaurantViewModel.swift
//  RestaurantViewModel
//
//  Created by Madhav Raj Verma on 29/11/21.
//

import Foundation


struct RestaurantViewState   {
    let restaurant:Restaurant
    
    var id :String {
        restaurant._id
    }
    
    var name:String {
        restaurant.name
    }
    
    var reslogo:String {
        restaurant.reslogo
    }
    
    var resImage :String {
        restaurant.resimage
    }
    
    var rating:String {
        restaurant.rating
    }
    
    
}

class RestaurantViewModel : ObservableObject {
    
    @Published var restaurants :[RestaurantViewState] = []
    
    init() {
        fetchAllRestaurant()
    }
    
    func fetchAllRestaurant() {
        guard let url = URL(string: "http://localhost:3000/shop/restaurants") else {
           fatalError()
       }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let httpRespnse = response as? HTTPURLResponse , (200..<300).contains(httpRespnse.statusCode) else {
                return
            }
            
            guard let data  = data  else {
                return
            }
            
             let result  =  try! JSONDecoder().decode(Restaurants.self, from: data)
            let restaurants:[RestaurantViewState]  = result.restaurants.compactMap { res in
             return RestaurantViewState(restaurant: res)
            }
            
            DispatchQueue.main.async {
                self.restaurants = restaurants
            }
        }

        task.resume()
    }
    
    func fetchSingleRestaurant(resID:String,  completion : @escaping (Restaurant) -> Void) {
        guard let singleRestaurantUrl = URL(string: "http://localhost:3000/shop/restaurant/\(resID)") else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: singleRestaurantUrl) { data, response, error in
            guard let httpRespnse = response as? HTTPURLResponse , (200..<300).contains(httpRespnse.statusCode) else {
                return
            }
            
            
                guard let data = data else {
                    return
                }
            
                let deocder = JSONDecoder()
                let restaurant  = try! deocder.decode(SingleRestaurant.self, from: data)
            DispatchQueue.main.async {
                completion(restaurant.restaurant)
            }
            
        }.resume()

    }
    
    
}
