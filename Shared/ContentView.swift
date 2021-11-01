//
//  ContentView.swift
//  Shared
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            }
            
            ChatScreen().tabItem {
                VStack {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
            }
            
            CartScreen().tabItem {
                VStack {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            }
            
            ProfileScreen().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
            
        }.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
