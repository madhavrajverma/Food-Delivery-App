//
//  NotificationView.swift
//  NotificationView
//
//  Created by Madhav Raj Verma on 25/11/21.
//

import SwiftUI



struct NotificationView: View {
    
    @Environment(\.presentationMode) var presenationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
             header
                    .padding(.top,10)
                ForEach(notifications) { notification in
                    SingleNotification(notification: notification)
                }
                
            }
        }
    }
    
    var header:some View {
        HStack {
            VStack(alignment:.leading,spacing: 6) {
                Button(action :{
                    presenationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .foregroundColor(Color.SearchBarIcon)
                        .padding()
                        .background(Color.orangeColor.opacity(0.2).cornerRadius(8))
                }

                Text("Notifications")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.bottom)
            }
            
            Spacer()
        }.padding(.leading,10)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}


struct SingleNotification: View {
    
    let notification:NotificationModel
    
    var body : some View {
        HStack {
            Image(notification.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            VStack(alignment:.leading,spacing: 4) {
                Text(notification.title)
                    .font(.body)
                    .fontWeight(.bold)
                    
                
                Text("10:AM")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            
            Spacer()
        }.frame(maxWidth:.infinity)
        .padding()
            
            .customShadow()
    }
}
