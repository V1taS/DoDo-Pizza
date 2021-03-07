//
//  NetworkServices.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import UIKit

class NetworkServices {
    
    static let shared = NetworkServices()
    
    private init() {}
    
    func execute(_ urlSTR: String,
                 completion: @escaping (_ result: [Pizza]?) -> Void) {
        
        guard let url = URL(string: urlSTR) else { return }
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        
        let urlSession = URLSession(configuration: configuration)
        urlSession.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let object = try jsonDecoder.decode(Welcome.self, from: data)
                completion(object.pizza)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
