//
//  ChatScreen.swift
//  ChatScreen
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

struct ChatScreen: View {
    var body: some View {
        NavigationView {
            GeometryReader {geo in
                ZStack {
                    Image("Pattern")
                        .resizable()
                        .scaledToFill()
                    ScrollView(showsIndicators:false) {
                        VStack(alignment:.leading) {

                            
                            Text("Chat")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .padding(.vertical)
                        
                            VStack {
                                NavigationLink(destination: ChatDetailView()) {
                                    ChatListView(image: "chatProfile1", name: "Madhav", msg: "Your Order just Arrived")
                                }
                                
                                NavigationLink(destination: ChatDetailView()) {
                                    ChatListView(image: "chatProfile2", name: "Rajnish", msg: "Your Order just Arrived")
                                }
                                
                                NavigationLink(destination: ChatDetailView()) {
                                    ChatListView(image: "chatProfile3", name: "Guy Hawkins", msg: "Your Order just Arrived")
                                }
                              
                               
                            }
                           
                        } .padding(.horizontal)
                    }.navigationBarHidden(true)
                }
            }
        }
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
