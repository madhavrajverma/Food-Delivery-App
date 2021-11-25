//
//  OnBoardingView.swift
//  OnBoardingView
//
//  Created by Madhav Raj Verma on 01/11/21.
//

import SwiftUI



struct Onboarding:Identifiable {
    var id  = UUID()
    let image:String
    let title :String
    let subtitle:String
}

let onBoarding = [
Onboarding(image: "Illustration", title: "Find Your Comfort Food here", subtitle: "Here you Can find a chef dish for every taste and color.Enjoy!"),
Onboarding(image: "Illustartion1", title: "Food Ninja is Where Your Comfort Food Lives", subtitle: "Enjoy a fast and smooth food delivery at your doorstep")

]


struct OnBoardingView: View {
    
    var body: some View {
        TabView {
            ForEach(onBoarding) {
            onBoard in
                SingleView(onBoard: onBoard)
            }
        }.tabViewStyle(PageTabViewStyle())
            
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}


struct SingleView:View {
    @State private var isAnimating: Bool = false
    
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    
    let onBoard:Onboarding
    var body: some View {
   
        VStack(alignment:.center) {
                Image(onBoard.image)
                    .resizable()
                    .frame(maxWidth:.infinity)
                    .frame(height:UIScreen.main.bounds.height * 0.35)
                    .padding(.horizontal)
                    
                
                Text(onBoard.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,10)
                
                
                Text(onBoard.subtitle)
                    .font(.headline)
                    .fontWeight(.light)
                    . multilineTextAlignment(.center)
                    .padding(.bottom)
                
                
                Button(action :{
                    isOnboarding = false
                }) {
                    HStack {
                        Text("Next")
                            
                        
                        Image(systemName: "arrow.right.circle")
                          .imageScale(.large)
                    }.foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                        .background(Color.greenColor.cornerRadius(10))
                }
                    
            }.padding()
                .padding(.bottom)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimating = true
                    }
                }
    }
}
