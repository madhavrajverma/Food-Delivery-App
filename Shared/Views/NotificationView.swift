//
//  NotificationView.swift
//  NotificationView
//
//  Created by Madhav Raj Verma on 28/10/21.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
  
                ScrollView(.vertical,showsIndicators:false) {

                    
                    VStack(alignment:.leading) {
                        
                        VStack(alignment:.leading) {
                            Button(action :{ presentationMode.wrappedValue.dismiss()}) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("searchBarIcon"))
                                    .padding()
                                    .background(Color("searchBarIcon").cornerRadius(10).opacity(0.3))
                            }
                            
                            Text("Notifications")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }.padding(.leading)
                        
                        SingleNotifcation(image: "checked", text: "Your order has been taken by the driver", time: "Recently")
                        SingleNotifcation(image: "money", text: "Topup for $100 was succesfull", time: "10:00 Am")
                        SingleNotifcation(image: "cancelOrder", text: "Your order has been canceled", time: "22 oct 2021")
                    }
                
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct SingleNotifcation:View {
    let image:String
    let text:String
    let time:String
    var body: some View {
        HStack {
            Image(image)
            VStack(alignment: .leading) {
                Text(text)
                Text(time)
            }
        }
        .frame(maxWidth:.infinity)
        .padding()
        .customShadow()
        .padding()
    }
}
