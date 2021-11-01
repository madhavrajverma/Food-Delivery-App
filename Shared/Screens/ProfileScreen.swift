//
//  ProfileScreen.swift
//  ProfileScreen
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
    ScrollView(.vertical,showsIndicators: false) {
            GeometryReader { geo in
                if  geo.frame(in:.global).minY > -400 {
                    Image("ProfilePic")
                        .resizable()
                        .scaledToFill()
                        .offset(y:-geo.frame(in: .global).minY)
                        .frame(width:geo.size.width,height: geo.frame(in: .global).minY + 400)
                }
 
            }.onAppear {
                
            }
            .frame(height:400)
            
        VStack {
                VStack(alignment:.leading) {
                    HStack {
                        Spacer()
                        Image("ScroollTools")
                        Spacer()
                    }.padding(.top,-40)

                    
                    HStack {
                        Text("Member Gold")
                            .foregroundColor(Color.yellowColor)
                            .padding()
                            .background(Color.yellowColor.opacity(0.3).cornerRadius(15))
                        
                        Spacer(minLength: 0)
                            
                    }.padding(.horizontal)
                    
                    HStack(alignment:.firstTextBaseline) {
                        VStack(spacing:2){
                            Text("Madhav Raj Verma")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal)
                            
                            Text("Madhavrajverma175@gmail.com")
                                .font(.subheadline)
                                .fontWeight(.light)
                        }
                        Spacer()
                        Image("EditIcon")
                            
                    }.padding(.trailing)

                    HStack() {
                        Image("VoucherIcon")

                        Text("You Have 3 Voucher")
                            .font(.body)
                            .fontWeight(.bold)
                    }.frame(maxWidth:.infinity)
                        .padding()
                        .customShadow()
                        .padding()

                    SectionTitle(title: "Favorite")
                        .padding(.vertical)
                        .padding(.horizontal)
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        VStack {
                            FavoriteFoodView(name: "Spacy fresh crab", price: "12$", image: "foodfav1")
                            FavoriteFoodView(name: "Spacy fresh crab", price: "12$", image: "foodfav2")
                            FavoriteFoodView(name: "Spacy fresh crab", price: "12$", image: "foodfav3")
                        }
                        .padding(.vertical)
                        
                    }
                    
                }
                
            }
            .padding(.vertical)
            .background(Color.white
                            .clipShape(CustomCorner())
                            .padding(.top,-50))
            .zIndex(0)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}



struct FavoriteFoodView: View {
    let name:String
    let price:String
    let image:String
    var body :some View {
 
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth:80,maxWidth: 80)
                
                HStack(alignment:.center) {
                    VStack(alignment:.leading) {
                        Text(name)
                            .foregroundColor(.black)
                            .font(.body)
                            
                        Text(price)
                            .foregroundColor(Color.greenColor)
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    
                    Button(action:{}) {
                        Text("Buy Again")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.greenColor.cornerRadius(30))
                    }
                }
                
            }.frame(maxWidth:.infinity)
            .padding()
                .customShadow()
        
        
    }
}


