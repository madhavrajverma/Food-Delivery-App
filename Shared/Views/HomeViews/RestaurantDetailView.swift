//
//  RestaurantDetailView.swift
//  RestaurantDetailView
//
//  Created by Madhav Raj Verma on 26/10/21.
//

import SwiftUI
import Introspect

struct RestaurantDetailView: View {
    var restaurantViewState:RestaurantViewState
    @State private var imageData:Data?
    @State var uiTabarController: UITabBarController?
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            GeometryReader { geo in
                if  geo.frame(in:.global).minY > -400 {
                    
                    if let data = imageData {
                        Image(uiImage:UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .offset(y:-geo.frame(in: .global).minY)
                            .frame(width:geo.size.width,height: geo.frame(in: .global).minY + 400)
                    }
                }
 
            }.frame(height:400)
            
            VStack {
                VStack(alignment:.leading) {
                    HStack {
                        Spacer()
                        Image("ScroollTools")
                        Spacer()
                    }.padding(.top,-40)
                    
                    HStack {
                        Text("Popular")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("GreenColor"))
                            .padding()
                            .background(Color.greenColor.opacity(0.3).cornerRadius(15))
                        
                        Spacer(minLength: 0)
                        Image("nav")
                            .padding()
                            .background(Color.greenColor.opacity(0.3).cornerRadius(50))
                        
                        Image("heart")
                            .padding()
                            .background(Color.heartRed.opacity(0.3).cornerRadius(50))
                            
                    }.padding(.horizontal)
                    Text("Wijie Bar and Resto")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                    HStack {
                        HStack {
                            Image("map-pin")
                            
                            Text("19 Km")
                                .font(.callout)
                                .fontWeight(.ultraLight)
                                .padding(4)
                                
                        }
                        
                        HStack {
                            Image("Star")
                                
                            
                            Text("4.8 rating")
                                .font(.callout)
                                .fontWeight(.ultraLight)
                                .padding(4)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    
                    Text("Most whole alaskan Red Kings Crabs get Broken down into legs claws and lumb meat .We offer all these options as well in our online shop . but there is nothing like getting the hole")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .lineLimit(4)
                        .padding(.horizontal)
                    
                    SectionTitle(title: "Popular Menu")
                        .padding(.vertical)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            FoodView(name: "Spacy fresh crab", price: "12$", image: "resMenu1")
                            FoodView(name: "Spacy fresh crab", price: "12$", image: "resMenu2")
                            FoodView(name: "Spacy fresh crab", price: "12$", image: "resMenu1")
                            FoodView(name: "Spacy fresh crab", price: "12$", image: "resMenu2")

                        }.padding(.vertical)
                    }
                    Text("Testimonials")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    TestimonialView()
                        .padding(.horizontal)
                    TestimonialView()
                        .padding(.horizontal)
                    
                    
                }
                
            }
            .padding(.vertical)
            .background(Color.white
                            .clipShape(CustomCorner())
                            .padding(.top,-50))
            .zIndex(0)
            .introspectTabBarController { (UITabBarController) in
                       UITabBarController.tabBar.isHidden = true
                       uiTabarController = UITabBarController
                   }.onDisappear{
                   
                           uiTabarController?.tabBar.isHidden = false
                       
                   }
            
            
            
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                fetchImage(url: restaurantViewState.resImage) {
                    data in
                    imageData = data
                }
            }
            
        
        
        
    }
}

//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantDetailView()
//    }
//}

struct FoodView: View {
    let name:String
    let price:String
    let image:String
    var body :some View {
        Button(action:{}) {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth:80,maxWidth: 100)
                
                Text(name)
                    .foregroundColor(.black)
                    .font(.body)
                    
                Text(price)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.light)
                
            }.padding()
                .customShadow()
        }
           
            
        
    }
}

struct TestimonialView :View {
    var body: some View {
                    HStack {
                        Image("PhotoProfile1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .padding()
                            .cornerRadius(8)
                        VStack(alignment:.leading) {
                            HStack(alignment:.top) {
                                VStack {
                                    Text("Dianne Russell")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                        .lineLimit(2)
                                    Text("12 April 2021")
                                        .font(.caption)
                                        .fontWeight(.ultraLight)
                                }
                                Spacer()
                                
                                HStack {
                                    Image("star1")
                                    Text("5")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.greenColor)
                                }.padding(5)
                                    .background(Color.greenColor.opacity(0.2).cornerRadius(10))
                            
                                
                            }
                            Text("This is grea So delicious , You must Here ,with your family")
                                .font(.caption)
                                .fontWeight(.light)
                                .lineLimit(2)
                            
                        }
                    
                    }.padding(6)
            .customShadow()
                }
                    
            }

 

