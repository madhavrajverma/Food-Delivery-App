//
//  PopularFood.swift
//  PopularFood
//
//  Created by Madhav Raj Verma on 25/11/21.
//

import SwiftUI

struct PopularFood: View {
    @Binding var isPopularMenu :Bool
    @State private var searchText: String = ""
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Pattern")
                    .resizable()
                    .scaledToFill()
                ScrollView {
                    VStack {
                        header
                        HStack {
                            VStack(alignment:.leading){
                                Text("Find Your")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("Favourite Food")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            Spacer()

                        }
                            .padding(.top,geo.size.height * 0.02)
                            .padding(.leading)
                        
                        

                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.SearchBarIcon)
                                TextField("What do you want to order", text: $searchText)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.orangeColor.opacity(0.5)))
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Popular Restaurant")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer(minLength: 0)
                        }.padding(.leading)
                        
                            LazyVStack{
                                ForEach(0..<10) {_ in
                                    NavigationLink(destination: FoodDetailView()) {
                                        MenuView(geo:geo)
                                    }
                                }
                                }.padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height:100)
                        }
                 
                }
            }
            
           
        }
    }
    
    
    var header:some View {
        HStack {
            VStack(alignment:.leading,spacing: 6) {
                Button(action :{
                    withAnimation(.spring()) {
                        isPopularMenu = false
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .foregroundColor(Color.SearchBarIcon)
                        .padding()
                        .background(Color.orangeColor.opacity(0.2).cornerRadius(8))
                }
            }
            
            Spacer()
        }.padding(.leading,10)
    }
}

//struct PopularFood_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularFood()
//    }
//}
