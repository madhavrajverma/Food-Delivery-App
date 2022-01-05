//
//  FoodDetailView.swift
//  FoodDetailView
//
//  Created by Madhav Raj Verma on 26/10/21.
//


import SwiftUI
import Introspect

let orders : [Food] = []

struct FoodDetailView: View {
    var foodViewState:FoodViewState
    @State var uiTabarController: UITabBarController?
    @State private var imageData:Data?
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var isPresented:Bool = false
    @FetchRequest(entity: Total.entity(), sortDescriptors: []) var totalOrder: FetchedResults<Total>

   
    var body: some View {
        ZStack(alignment:.bottom) {
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
                                .foregroundColor(Color.greenColor)
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
                        Text(foodViewState.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .lineLimit(2)
                            
                        HStack {
                         
                            HStack {
                                Image("Star")
                                    
                                
                                Text("4.8 rating")
                                    .font(.callout)
                                    .fontWeight(.ultraLight)
                                    .padding(4)
                            }
                            
                            HStack {
                                Image("shopping-bag")
                                
                                Text("2000+ order")
                                    .font(.callout)
                                    .fontWeight(.ultraLight)
                                    .padding(4)
                                    
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal)
                        
            Text("""
    Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.
        Strowberry
        Cream
        wheat
    Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.
    """)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding()
                        
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
            Button(action :{
               let foodOrder = FoodOrder(context: managedObjectContext)
                foodOrder.id = UUID().uuidString
                foodOrder.imageUrl = foodViewState.imageUrl
                foodOrder.restaurantName = foodViewState.restaurantname
                foodOrder.foodDescription = foodViewState.description
                foodOrder.name = foodViewState.name
                foodOrder.price = foodViewState.price
                foodOrder.count = 1;
                managedObjectContext.performAndWait {
                    totalOrder[0].total += Int32(foodOrder.price!)!;
                }
            
                do {
                    try managedObjectContext.save()
                    isPresented = true
                }catch  {
//                    print(error?.localizedDescription)
                }
                
            }) {
                Text("Add To Cart")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(LinearGradient(colors: [Color.greenColor,Color.green], startPoint: .leading, endPoint: .trailing).cornerRadius(10))
                    .offset(y:10)
                    
            }.padding(.horizontal)
                .alert(isPresented: $isPresented) {
                    Alert(title: Text("Order Save"), message: Text("Food Added to Your Cart Go and Checkout"), primaryButton: .default(Text("Ok")), secondaryButton: .cancel())
                }
            
            
        }.onAppear {
            fetchImage(url: foodViewState.imageUrl) { data in
                imageData = data
            }
        }
            
        
    }
}

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView()
//    }
//}

