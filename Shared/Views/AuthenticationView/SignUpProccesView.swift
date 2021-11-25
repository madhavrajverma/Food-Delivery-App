//
//  SignUpProccesView.swift
//  SignUpProccesView
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import SwiftUI

struct SignUpProccesView: View {
    
    @State private var firstName:String = ""
    @State private var lastName:String = ""
    @State private var mobileNumber:String = ""
    
    
    var body: some View {

                VStack {
                    HStack {
                        Button(action :{ }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("searchBarIcon"))
                                .padding()
                                .background(Color("searchBarIcon").cornerRadius(10).opacity(0.3))
                        }
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Text("Fill in Your bio to get started")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text("This data will displayed your account profile for security")
                        .font(.footnote)
                        .padding(.vertical)
                        .lineLimit(2)
                    
                    
                    
                    
                    VStack {
                        
                        TextField("First Name",text:$firstName)
                            .modifier(customTextFieldModifier())
                        TextField("Last Name",text:$lastName)
                            .modifier(customTextFieldModifier())
                          
                            
                        SecureField("Mobile Number",text: $mobileNumber)
                            .modifier(customTextFieldModifier())
                            
                    }.padding(.horizontal)
                    
                    
                    
                    
                  Spacer()
                    Button(action :{ }) {
                            Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                            .background(Color.greenColor.cornerRadius(10))
                    }.padding(.bottom)
                    
                    
                }
                
            
        
    

    }
}

struct SignUpProccesView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpProccesView()
    }
}
