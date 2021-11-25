//
//  UploadPhotoView.swift
//  UploadPhotoView
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import SwiftUI

struct UploadPhotoView: View {
    var body: some View {
        ScrollView {
            
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
                VStack {
                    
                    galleryButton
                        .frame(maxWidth:.infinity)
                        .padding()
                        .customShadow()
                        .padding()
                    
                    cameraButton
                        .frame(maxWidth:.infinity)
                        .padding()
                        .customShadow()
                        .padding()
                        
                }.padding(.horizontal)
                
                
                
                
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
    
    
    var galleryButton :some View {
        Button(action:{}) {
            VStack {
                Image("gallery")
                Text("From Gallery")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
        }
    }
    
    
    var cameraButton :some View {
        Button(action:{}) {
            VStack {
                Image("camera")
                Text("Take Photo")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView()
    }
}
