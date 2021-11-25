//
//  LogInView.swift
//  LogInView
//
//  Created by Madhav Raj Verma on 01/11/21.
//

import SwiftUI

struct LogInView: View {
    @State private var email:String  = ""
    @State private var password:String  = ""
    
    var body: some View {
        ScrollView(showsIndicators:false){
                VStack(alignment:.center){
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 80, maxWidth: 120, minHeight: 80, maxHeight: 120)
                        .padding(.horizontal,20)
                    
                    VStack(spacing:0) {
                        
                        Text("FoodNinja")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.greenColor)
                        
                        Text("Deliver Favouite Food")
                            .font(.caption)
                        
                    }
                    .padding(.vertical)
                    Text("Login To Your Account")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    
                    
                    VStack {
                        TextField("Email",text:$email)
                            .modifier(customTextFieldModifier())
                          
                            
                        SecureField("Password",text: $password)
                            .modifier(customTextFieldModifier())
                            
                    }  .padding(.horizontal)
                    
                    Text("Or Continue With")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    HStack {
                      Spacer()
                        facebookButton
                            .customShadow()
                        Spacer()
                        googleButton
                            .customShadow()
                        Spacer()
                    }
                    
                    Text("Forgot Your Password")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color.greenColor)
                    
                    Button(action:{ }) {
                        Text("LogIn")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.greenColor.cornerRadius(10))
                    }
                    
                }
            }
    }
    
    
    var facebookButton :some View {
        Button(action :{}) {
            HStack {
                Image("facebook")
                Text("Facebook")
                    .fontWeight(.bold)
            }
        }.padding()
        .background(Color.bellicon.cornerRadius(10))    }


    var googleButton :some View {
        Button(action :{}) {
            HStack {
                Image("google")
                Text("Google")
                    .fontWeight(.bold)
            }
        }.padding()
            .background(Color.bellicon.cornerRadius(10))
    }}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}



