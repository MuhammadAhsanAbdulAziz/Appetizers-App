//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image : Image? = nil
    
    func load(fromURLString urlString:String){
        NetworkManager.shared.downloadImages(fromURLString: urlString) { (UiImage) in
            guard let UiImage = UiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: UiImage)
            }
            
        }
    }
}

struct RemoteImage : View{
    var image : Image?
    
    var body: some View{
        image?.resizable() ?? Image("placeholder-food").resizable()
    }
}

struct AppetizerRemoteImage : View{
    @StateObject var imageLoader = ImageLoader()
    var fromURLString : String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: fromURLString)
            }
    }
}
