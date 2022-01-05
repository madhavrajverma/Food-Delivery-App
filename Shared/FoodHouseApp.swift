//
//  FoodHouseApp.swift
//  Shared
//
//  Created by Madhav Raj Verma on 18/10/21.
//

import SwiftUI
import CoreData

@main
struct FoodHouseApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    init() {
        orderData()
    }
    
    var body: some Scene {
        WindowGroup {
            
//            UploadPhotoView()
   
            if isOnboarding {
                OnBoardingView()
                      .environment(\.managedObjectContext, persistenceController.container.viewContext)

            }else {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)

            }
        }.onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
        
    }
    func orderData() {
        let order = Total(context : persistenceController.container.viewContext)
        order.total = 0
        persistenceController.save()
    }
}


