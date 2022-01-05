//
//  CartScreen.swift
//  CartScreen
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

struct CartScreen: View {
    @FetchRequest(entity: FoodOrder.entity(), sortDescriptors: []) var foodOrders: FetchedResults<FoodOrder>
    @FetchRequest(entity: Total.entity(), sortDescriptors: []) var totalOrder: FetchedResults<Total>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Pattern")
                    .resizable()
                    .scaledToFill()
                VStack {
                    VStack {
                        HStack {
                            VStack(alignment:.leading){
                                Text("Order details")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                            }
                            Spacer()
                            
                        }
                        .padding(.top,geo.size.height * 0.02)
                        .padding(.leading)
                        
                            
                        List {
                            ForEach(foodOrders,id:\.self) { food  in
                                VStack {
                                    SingleOrderFoodView(foodOrder: food, value: Int(food.count), geo:geo)
                                }
                            }.onDelete(perform: removeOrder)
                        }.listStyle(.plain)
                        
                        
                        
                        if !foodOrders.isEmpty {
                            VStack {
                                HStack {
                                    Text("Total")
                                        .font(.title2)   .foregroundColor(.white)
                                    Spacer()
                                    Text(String.formatedString(text: totalOrder[0].total))
                                        .font(.title2)   .foregroundColor(.white)
                                }.padding()
                                
                                Button(action :{
                                    
                                }) {
                                    Text("Place My Order")
                                        .foregroundColor(Color.green)
                                        .frame(maxWidth:.infinity)
                                        .padding()
                                        .background(Color.white.cornerRadius(10))
                                        .padding()
                                }
                                
                            }
                            .padding()
                            .background(Color.green.opacity(0.7).cornerRadius(10))
                            .padding()
                            .shadow(color: Color.greenColor.opacity(0.2), radius: 10, x: 0, y: 20)
                        }
                        
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height:150)
                        }
                    
                    
                    
                 
                }
            }.onDisappear {
                if managedObjectContext.hasChanges {
                    PersistenceController.shared.save()
                }
            }
            
           
        }
    }
    
    private func removeOrder(indexSet: IndexSet) {
        for index in indexSet {
            let foodOrder = foodOrders[index]
            totalOrder[0].total -= Int32(foodOrder.price!)!
            
            managedObjectContext.delete(foodOrder)
        }
        DispatchQueue.main.async {
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            } }
    }
    
}

//struct CartScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CartScreen()
//    }
//}


struct SingleOrderFoodView:View {
    let foodOrder:FoodOrder
    @State  var value:Int
    let geo:GeometryProxy
    @State private var imageData:Data?
    
    var body:some View {
     
            HStack {
        
                if let data = imageData {
                    Image(uiImage:UIImage(data: data)!)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .frame(width: 80, height: 100)
                }
                
                VStack {
                    Text(foodOrder.name ?? "")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text(foodOrder.restaurantName ?? "")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Text(foodOrder.price ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                Spacer()
                
//                CustomStepper(value: $value)

            }.padding(.horizontal, 10)
            .padding(.vertical)
            .customShadow()
            .onAppear {
                fetchImage(url: foodOrder.imageUrl ?? "") { data in
                    imageData = data
                }
            }
            
        
            
    }
}



/*

struct CustomStepper : View {
    @Binding var value: Int

    var body: some View {
            HStack {
                Spacer()

                Button(action: {
                    if self.value > 0 {
                        self.value -= 1
                        self.feedback()
                    }
                }, label: {
                    Image(systemName: "minus")
                        .font(.subheadline)
                        .foregroundColor(Color.green)
                        .padding(8)
                        .background(Color.green.opacity(0.2).cornerRadius(8))
                        .shadow(radius: 2)
                        
                        
                })
                
                Text(" \(value)")
                    .font(.headline)
                    .foregroundColor(Color.green)
                    .font(.system(.body, design: .rounded))
                   


                Button(action: {
                    if self.value < 10 {
                        self.value += 1
                        self.feedback()
                    }
                }, label: {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(Color.green.cornerRadius(8))
                        .shadow(radius: 2)
                })
        }
    }

    func feedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
*/


/*
struct TotalView :View {
    let foodOrders: FetchedResults<FoodOrder>
   
    var subTotalPrice :Int  = 0

    var body :some View {
        VStack {
            VStack(alignment:.leading) {
                HStack{
                    Text("Sub Total")
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(subTotalPrice)$")   .foregroundColor(.white)
                }.padding(.horizontal)
                HStack{
                    Text("Deliver Charge")   .foregroundColor(.white)
                    Spacer()
                    Text("10$")   .foregroundColor(.white)
                }.padding(.horizontal)
                
                HStack{
                    Text("Discount")   .foregroundColor(.white)
                    Spacer()
                    Text("20$")   .foregroundColor(.white)
                }.padding(.horizontal)
            }
            
            HStack {
                Text("Total")
                    .font(.title2)   .foregroundColor(.white)
                Spacer()
                Text("150$")
                    .font(.title2)   .foregroundColor(.white)
            }.padding()
            
            Button(action :{
                
            }) {
                Text("Place My Order")
                    .foregroundColor(Color.green)
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(Color.white.cornerRadius(10))
                    .padding()
            }
            
        }
        .padding()
        .background(Color.green.opacity(0.7).cornerRadius(10))
        .padding()
        .shadow(color: Color.greenColor.opacity(0.2), radius: 10, x: 0, y: 20)
    }
    
    mutating func subTotal() {
           for food in foodOrders {
               let price = Int(food.price!) ?? 0
               subTotalPrice += price
           }

       }
}
 
 */
