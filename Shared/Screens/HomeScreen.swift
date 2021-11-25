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
                                                    
                            HStack {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color.SearchBarIcon)
                                    TextField("What do you want to order", text: $searchText)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.orangeColor.opacity(0.5)))
                              
                            }
                                
                        
                           
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
                                                NavigationLink(destination: RestaurantDetailView()) {
                                                    RestaurantView(name: "Vegan Resto", nearest: "5mins", image: "vegan",geo:geo)
                                                }
                                                Spacer()
                                                NavigationLink(destination: RestaurantDetailView()) {
                                                    RestaurantView(name: "Health Food", nearest: "12mins", image: "healthy",geo:geo)
                                                }
                                            }
                                            
                                        HomeSectionTitle(title: "Popular Menu") {
                                            withAnimation(.spring()) {
                                                isPopularMenu = true
                                            }
                                        }
                                            
                                            ForEach(0..<4) { _ in
                                                NavigationLink(destination: FoodDetailView()) {
                                                    MenuView(geo:geo)
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
                    PopularRestaurant(isPopularRestaurant: $isPopularRestaurant)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        

               }else if isPopularMenu && !isPopularRestaurant {
                   PopularFood(isPopularMenu:$isPopularMenu)
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
    let name:String
    let nearest:String
    let image:String
    let geo:GeometryProxy
    var body :some View {
   
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:geo.size.width *  0.35,height: 100)
                
                Text(name)
                    .foregroundColor(.black)
                    .font(.body)
                    
                Text(nearest)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.light)
                
            }.padding()
            .customShadow()
        
           
            
        
    }
}


struct MenuView:View {
    let geo:GeometryProxy
    var body:some View {
     
            HStack {
                Image("fruitSalad")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .frame(width: geo.size.width * 0.35, height: 100)
                
                VStack {
                    Text("Herbal Pancake")
                        .font(.body)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text("Warung Herbal")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.light)
                }
                Spacer()
                
                
                Text("$9")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
            }.padding(.horizontal, 10)
            .padding(.vertical)
            .customShadow()
        
            
    }
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
