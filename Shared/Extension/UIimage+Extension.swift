//
//  UIimage+Extension.swift
//  UIimage+Extension
//
//  Created by Madhav Raj Verma on 29/11/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine




func fetchImage(url:String , completion : @escaping  (Data) -> Void)  {
    
    guard let imageUrl = URL(string: "http://localhost:3000/\(url)") else {
        fatalError()
    }
    
    URLSession.shared.dataTask(with: imageUrl) { data, respnse, error in
        guard let httpReponse = respnse as? HTTPURLResponse ,(200..<300).contains(httpReponse.statusCode) else {
            return
        }

        guard let data = data else {
            return
        }

        DispatchQueue.main.async {
            completion(data)
        }

    }.resume()

}


//struct URLImage:View {
//    @ObservedObject var imageLoader = imageLoader()
//    init() {
//        self.imageLoader.downloadImage(url: "")
//    }
//
//    var body: some View {
//
//        if let data = self.imageLoader.downloadedData {
//            return Image(uiImage: UIImage(data: data)!).resizable()
//        }else {
//            return Image(systemName: "photo.fill")
//        }
//    }
//
//}


//class ImageLoader: ObservableObject {
//
//    @Published var downloadedData:Data?
//
//    func downloadImage(url:String) {
//        guard let imageUrl  = URL(string: url) else {return}
//
//        URLSession.shared.dataTask(with: imageUrl) { data, _ , error in
//            guard let data = data ,error == nil else {return}
//
//            DispatchQueue.main.async {
//                self.downloadedData = data
//            }
//        }.resume()
//    }
//}








//struct ImageWithURL: View {
//
//    @ObservedObject var imageLoader: ImageLoaderAndCache
//    var geo:GeometryProxy
//
//    init(_ url: String,_ geo: GeometryProxy) {
//        imageLoader = ImageLoaderAndCache(imageURL: url)
//        self.geo = geo
//    }
//
//    var body: some View {
//          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
//            .resizable()
//            .scaledToFill()
//            .frame(width:geo.size.width *  0.35,height: 100)
//    }
//}
//
//class ImageLoaderAndCache: ObservableObject {
//
//    @Published var imageData = Data()
//
//    init(imageURL: String) {
//        let cache = URLCache.shared
//        guard let imageUrl = URL(string: "http://localhost:3000/ + \(imageURL)") else {
//            fatalError()
//        }
//        let request = URLRequest(url: imageUrl, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
//        if let data = cache.cachedResponse(for: request)?.data {
//            print("got image from cache")
//            self.imageData = data
//        } else {
//            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
//                if let data = data, let response = response {
//                let cachedData = CachedURLResponse(response: response, data: data)
//                                    cache.storeCachedResponse(cachedData, for: request)
//                    DispatchQueue.main.async {
//                        print("downloaded from internet")
//                        self.imageData = data
//                    }
//                }
//            }).resume()
//        }
//    }
//}


/*


class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}






 
func fecthImage(url:String, completion: @escaping (UIImage) -> Void) {
        guard let imageUrl = URL(string: "http://localhost:3000/ + \(url)") else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, respnse, error in
            guard let httpReponse = respnse as? HTTPURLResponse ,(200..<300).contains(httpReponse.statusCode) else {
                return
            }
        
            guard let data = data else {
                return
            }
    
            DispatchQueue.main.async {
                completion(UIImage(data: data) ?? UIImage())
            }
            
        
        }.resume()
        

    }



*/
