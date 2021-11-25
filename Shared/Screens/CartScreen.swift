//
//  CartScreen.swift
//  CartScreen
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

struct CartScreen: View {

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Pattern")
                    .resizable()
                    .scaledToFill()
                ScrollView {
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
                            LazyVStack{
                                ForEach(0..<3) {_ in
                                    NavigationLink(destination: FoodDetailView()) {
                                        SingleOrderFoodView(geo:geo)
                                        
                                    }
                                }
                                }.padding(.horizontal)
                        
                        
                        TotalView()
                        
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height:150)
                        }
                    
                    
                    
                 
                }
            }
            
           
        }
    }
}

//struct CartScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CartScreen()
//    }
//}


struct SingleOrderFoodView:View {
    @State private var value:Int = 1
    let geo:GeometryProxy
 
    var body:some View {
     
            HStack {
                Image("fruitSalad")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .frame(width: 80, height: 100)
                
                VStack {
                    Text("Herbal Pancake")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text("Warung Herbal")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Text("$9")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                Spacer()
                
                CustomStepper(value: $value)
                
                
               
                
            }.padding(.horizontal, 10)
            .padding(.vertical)
            .customShadow()
        
            
    }
}


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
                    if self.value < 1 {
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


struct TotalView :View {
    var body :some View {
        VStack {
            VStack(alignment:.leading) {
                HStack{
                    Text("Sub Total")
                        .foregroundColor(.white)
                    Spacer()
                    Text("120$")   .foregroundColor(.white)
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
            
            Button(action :{}) {
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
}
