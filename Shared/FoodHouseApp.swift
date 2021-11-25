//
//  FoodHouseApp.swift
//  Shared
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI

@main
struct FoodHouseApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            
            SignUpProccesView()
            
//            if isOnboarding {
//                OnBoardingView()
//            }else {
//                ContentView()
//            }
        }
    }
}


