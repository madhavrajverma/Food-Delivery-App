//
//  ChatDetailView.swift
//  ChatDetailView
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import SwiftUI
import Combine
import Introspect

struct Message:Identifiable {
    var id = UUID()
    let message:String
    let username:String
}


struct ChatDetailView: View {
    @State var uiTabarController: UITabBarController?
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    @State private var username:String = "Madhav"
    @State private var message: String = ""
    @State private var cancellable:AnyCancellable?
    let messages : [Message] = [
        
        Message(message: "Hii",username: "Madhav"),
        Message(message: "Hello",username: "Rajnish"),
        Message(message: "Hii",username: "Madhav"),
        Message(message: "Hello",username: "Rajnish"),
        Message(message: "Hii",username: "Madhav"),
        Message(message: "Hello",username: "Rajnish"),
        Message(message: "Hii",username: "Madhav"),
        Message(message: "Hello",username: "Rajnish"),
        Message(message: "Hii",username: "Madhav"),
        Message(message: "Hello",username: "Rajnish"),
        
    ]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    ChatProfile()
                }
            }
            
            ScrollView {
                ScrollViewReader {scrollview in
                    VStack {
                        ForEach(messages) {
                            message in
                            HStack {
                                if message.username == username {
                                    Spacer()
                                    MessageView(username: message.username, messageText: message.message, style: .primary)
                                }else {
                                    MessageView(username: message.username, messageText: message.message, style: .secondary)
                                    Spacer()
                                }
                            }.padding()
                                .id(message.id)
                        }
                    }.onAppear {
                        if messages.count > 0  {
                            DispatchQueue.main.async {
                                withAnimation {
                                    scrollview.scrollTo(messages[messages.endIndex - 1].id, anchor: .bottom)
                                }
                            }
                        }
                    }
                }
            }
            HStack {
                TextField("Write message here", text: $message)
                    .modifier(customTextFieldModifier())
                
                Button(action: {
                    
                    //                        sendMessage()
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color.greenColor)
                })
            }.padding()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .introspectTabBarController { (UITabBarController) in
                   UITabBarController.tabBar.isHidden = true
                   uiTabarController = UITabBarController
               }.onDisappear{
               
                       uiTabarController?.tabBar.isHidden = false
                   
               }
    }

    
}


struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetailView()
    }
}
