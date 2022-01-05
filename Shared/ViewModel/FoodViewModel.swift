//
//  FoodViewModel.swift
//  FoodViewModel
//
//  Created by Madhav Raj Verma on 29/11/21.
//

import Foundation


struct FoodViewState   {
    let food:Food
    
    var id :String {
        food._id
    }
    
    var name:String {
        food.name
    }
    
    var description:String {
        food.description
    }
    
    var imageUrl :String {
        food.imageUrl
    }
    
    var restaurantname:String {
        food.restaurantname
    }
    var price:String {
        food.price
    }
    
    
}


class FoodViewModel: ObservableObject {
    @Published var foods : [FoodViewState] = []
    init() {
        fetchAllFoods()
    }
    
    func fetchAllFoods() {
        
        guard let foodsUrl = URL(string: "http://localhost:3000/shop/foods") else {
           fatalError()
        }
        
        URLSession.shared.dataTask(with: foodsUrl) { data, respnse, error in
            guard let httpReponse = respnse as? HTTPURLResponse ,(200..<300).contains(httpReponse.statusCode) else {
                return
            }
            
            guard let data = data else {
                return
            }
           
            let results  = try! JSONDecoder().decode([Food].self, from: data)
            
            let result: [FoodViewState] = results.compactMap { food in
                return FoodViewState(food: food)
            }
            
            DispatchQueue.main.async {
                self.foods = result
            }
            
        }.resume()
    }
    
    func fetchSingleFood(foodId:String , completion :@escaping (Food) -> Void) {
        guard let SingleFoodUrl = URL(string: "http://localhost:3000/shop/food/\(foodId)") else {
           fatalError()
        }
        URLSession.shared.dataTask(with: SingleFoodUrl) { data, respnse, error in
            guard let httpReponse = respnse as? HTTPURLResponse ,(200..<300).contains(httpReponse.statusCode) else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let result = try! JSONDecoder().decode(SingleFood.self, from: data)
            DispatchQueue.main.async {
                completion(result.food)
            }
            
        }.resume()
    }
}
