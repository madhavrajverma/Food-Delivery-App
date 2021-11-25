//
//  SignUpSuccesNotificationView.swift
//  SignUpSuccesNotificationView
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import SwiftUI

struct SignUpSuccesNotificationView: View {
    var body: some View {
        VStack {
            
            Spacer()
            Image("Congrats")
                .resizable()
                .frame(minWidth: 150, maxWidth: UIScreen.main.bounds.width - 60, minHeight: 150
                       , maxHeight: UIScreen.main.bounds.height / 2.8 )
                .padding()
            
            Text("Congrats").font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.greenColor)
            
            Text("Your Profile is Ready to Use")
            
            Spacer()
            Button(action :{ }) {
                    Text("Try Order")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                    .background(Color.greenColor.cornerRadius(10))
            }.padding(.bottom)
            
        }
    }
}

struct SignUpSuccesNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSuccesNotificationView()
    }
}
