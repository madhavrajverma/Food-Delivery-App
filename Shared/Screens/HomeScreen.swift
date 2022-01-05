//
//  HomeScreen.swift
//  HomeScreen
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI
import Introspect




struct HomeScreen: View {
    @State private var searchText:String = ""
    @State private var isNotification:Bool = false
    @State private var isPopularRestaurant:Bool = false
    @State private var isPopularMenu :Bool = false
    @State private var isHome:Bool = false
    @StateObject var restaurantViewModel :RestaurantViewModel = RestaurantViewModel()
    @StateObject var foodViewModel:FoodViewModel = FoodViewModel()
   
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                if !isPopularRestaurant && !isPopularMenu {
                    ZStack {
                        Image("Pattern")
                            .resizable()
                            .scaledToFill()
                        ScrollView(.vertical,showsIndicators: false) {
                            
                         
                            
                            VStack {
                                HeaderView(isNotification: $isNotification)
                                    .padding(.top,geo.size.height * 0.02)
                                                    
//                            HStack {
//                                HStack {
//                                    Image(systemName: "magnifyingglass")
//                                        .foregroundColor(Color.SearchBarIcon)
//                                    TextField("What do you want to order", text: $searchText)
//                                }
//                                .padding()
//                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.orangeColor.opacity(0.5)))
//
//                            }
                                
                        
                           
                                    VStack {
                                        Image("PromoAdvertising")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.3)
                                            .cornerRadius(10)
                                            
                                            
                                        HomeSectionTitle(title: "Nearest Restaurant") {
                                            withAnimation(.spring()) {
                                                isPopularRestaurant = true
                                            }
                                        }
                                        HStack {
                                            ForEach(restaurantViewModel.restaurants.prefix(2),id:\.id) { restaurant in
                                               
                                                NavigationLink(destination: RestaurantDetailView(restaurantViewState: restaurant)) {
                                                        RestaurantView(restaurant:restaurant,geo:geo)
                                                }
                                                Spacer()

                                            }
                                        }
                                        HomeSectionTitle(title: "Popular Menu") {
                                            withAnimation(.spring()) {
                                                isPopularMenu = true
                                            }
                                        }
                                            
                                        ForEach(foodViewModel.foods.prefix(4),id:\.id) { food in
                                            NavigationLink(destination: FoodDetailView(foodViewState: food)) {
                                                    MenuView(food: food, geo:geo)
                                                }
                                            }
                                            
                                    }

                            }.padding(.horizontal)
                            
                           
                            
                      Rectangle()
                                .fill(Color.white)
                                .frame(height:100)
                        
                        }
                    }
                }
                
               else  if !isPopularMenu && isPopularRestaurant   {
                   PopularRestaurant(restaurantViewModel:restaurantViewModel,isPopularRestaurant: $isPopularRestaurant )
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        

               }else if isPopularMenu && !isPopularRestaurant {
                   PopularFood(isPopularMenu:$isPopularMenu, foodViewModel: foodViewModel)
                       .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
               }
                
                
                
            
            }.navigationBarHidden(true)
                
                
        }.fullScreenCover(isPresented: $isNotification) {
                NotificationView()
        }
    }
        
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct SectionTitle: View {
    
    let title:String
    var body:some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Button(action: {
                
            }) {
                Text("View More")
                    .font(.body)
                    .foregroundColor(Color.orangeColor)
                    
            }
        }
        
    }
}

struct HomeSectionTitle: View {
    
    let title:String
    let action: () -> Void
    var body:some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Button(action: {
                action()
            }) {
                Text("View More")
                    .font(.body)
                    .foregroundColor(Color.orangeColor)
                    
            }
        }
        
    }
}




struct RestaurantView:View {
    
    let restaurant:RestaurantViewState
    let geo:GeometryProxy
   @State private var imageData:Data?
    
    var body :some View {
   
        VStack(spacing:5) {
                if let data = imageData {
                    Image(uiImage:UIImage(data: data)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width:geo.size.width *  0.35,height: 100)
                }

                Text(restaurant.name)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(.top,15)
                    
                Text("2.5 km")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.light)
                
                
            }.padding()
            .customShadow()
            .onAppear {
                fetchImage(url: restaurant.reslogo) { data in
                    imageData = data
                }
            }
        
           
            
        
    }
    
  
}


struct MenuView:View {
    let food:FoodViewState
    let geo:GeometryProxy
    
    @State private var imageData:Data?
    var body:some View {
     
            HStack {
                if let data = imageData {
                    Image(uiImage:UIImage(data: data)!)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .frame(width: geo.size.width * 0.35, height: 100)
                }
                
                VStack(alignment:.leading) {
                    Text(food.name)
                        .font(.body)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text(food.restaurantname)
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.light)
                }
                Spacer()
                
                
                Text("$\(food.price)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
            }.padding(.horizontal, 10)
            .padding(.vertical)
            .customShadow()
            .onAppear {
                fetchImage(url: food.imageUrl) {
                    data in
                    imageData = data
                }
            }
        
            
    }
    
//    func fetchImage(url:String)  {
//
//        guard let imageUrl = URL(string: "http://localhost:3000/\(url)") else {
//            fatalError()
//        }
//
//        URLSession.shared.dataTask(with: imageUrl) { data, respnse, error in
//            guard let httpReponse = respnse as? HTTPURLResponse ,(200..<300).contains(httpReponse.statusCode) else {
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                imageData = data
//            }
//
//        }.resume()
//
//    }
}




struct HeaderView:View {
    @Binding var isNotification:Bool
    var body :some View {
        VStack {
            HStack {
                VStack(alignment:.leading){
                    Text("Find Your")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Favourite Food")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
            
                Button(action:{isNotification = true}) {
                    ZStack {
                        Image(systemName: "bell")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.bellicon))
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        
                        Circle()
                            .fill(.red)
                            .frame(width:8)
                            .offset(x:4,y: -12)
                        
                    }
                    
                
                }
                
        
            }
        }
    }
}
