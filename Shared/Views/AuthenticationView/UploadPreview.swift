//
//  UploadPreview.swift
//  UploadPreview
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import SwiftUI

struct UploadPreview: View {
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
            
            Text("Upload Your Profile Photo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(2)
            
            Text("This data will displayed your account profile for security")
                .font(.footnote)
                .padding(.vertical,5)
                .lineLimit(2)
        
            Image("ProfilePic")
                .frame(minWidth: 150, maxWidth: UIScreen.main.bounds.width - 40, minHeight: 150
                       , maxHeight: UIScreen.main.bounds.height / 2.5 )
                .cornerRadius(10)

            
            
            
            
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

struct UploadPreview_Previews: PreviewProvider {
    static var previews: some View {
        UploadPreview()
    }
}
