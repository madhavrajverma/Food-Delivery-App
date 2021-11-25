//
//  SignUpView.swift
//  SignUpView
//
//  Created by Madhav Raj Verma on 01/11/21.
//

import SwiftUI

struct SignUpView: View {

    @State private var email:String  = ""
    @State private var password:String  = ""
    @State private var username:String  = ""
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
                    Text("Sign Up for Free")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    
                    
                    VStack {
                        
                        TextField("Username",text:$username)
                            .modifier(customTextFieldModifier())
                        TextField("Email",text:$email)
                            .modifier(customTextFieldModifier())
                          
                            
                        SecureField("Password",text: $password)
                            .modifier(customTextFieldModifier())
                            
                    }  .padding(.horizontal)
                
                    
                    Button(action:{ }) {
                        Text("Create Account")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.greenColor.cornerRadius(10))
                    }
                    .padding(.vertical)
                    
                    Button(action:{ }) {
                        Text("Already Have acoount")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.greenColor)
                    }
                    
                    
                }
            }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
