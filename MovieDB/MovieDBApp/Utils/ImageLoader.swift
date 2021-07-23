//
//  ImageLoader.swift
//  MovieDB
//
//  Created by Amit Singh on 22/07/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var data: Data?
    
    func loadData(from urlString: String?) {
//        debugPrint("http://image.tmdb.org/t/p/"+urlString!)
        if let urlString = urlString {
            guard let url = URL(string: "http://image.tmdb.org/t/p/"+urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.data = data
                }
            }
            task.resume()
        }
    }
}


