//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizerUrl = baseUrl +  "appetizers"
    
    private init(){}
    
    func getAppetizers() async throws -> [Appetizer]{
        guard let url = URL(string: appetizerUrl) else {
            throw APError.invalidURL
        }
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch{
            throw APError.invalidData
        }
        
        
        
    }
    
    func downloadImages(fromURLString:String,completed: @escaping(UIImage?)->Void){
        let cacheKey = NSString(string: fromURLString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string:fromURLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}
