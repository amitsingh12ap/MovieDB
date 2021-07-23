//
//  MovieListVM.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI
import Combine

class MovieListVM: ObservableObject {
    
    @Published var topRatedMovies   : [TopRatedResult]      = [TopRatedResult]()
    @Published var trendingMovies   : [TrendingMovieResult] = [TrendingMovieResult]()
    @Published var nowPlayingMovies : [NowPlayingResult]    = [NowPlayingResult]()
    
}
extension MovieListVM {
    func getMovies(){
        let dispatchQueue = DispatchQueue(label: "myQueue", qos: .background)
        let semaphore = DispatchSemaphore(value: 0)
        
        dispatchQueue.async {
            HomeService.shared.fetchTrendingMovies {[weak self] (result) in
                switch result {
                case .success(let model):
                    debugPrint("found result trending ")
                    if let result = model?.results {
                        DispatchQueue.main.async {
                            self?.trendingMovies = result
                        }
                        
                    }
                case .failure(let apiError):
                    debugPrint(apiError.rawValue)
                }
                semaphore.signal()
            }
            
            HomeService.shared.fetchTopratedMovies {[weak self] (result) in
                switch result {
                case .success(let model):
                    debugPrint("found result top rated")
                    if let result = model?.results {
                        DispatchQueue.main.async {
                            self?.topRatedMovies = result
                        }
                        
                    }
                case .failure(let apiError):
                    debugPrint(apiError.rawValue)
                }
                semaphore.signal()
            }
            
            HomeService.shared.fetchNowPlayingMovies {[weak self] (result) in
                switch result {
                case .success(let model):
                    debugPrint("found result now playing")
                    if let result = model?.results {
                        DispatchQueue.main.async {
                            self?.nowPlayingMovies = result
                        }
                    }
                case .failure(let apiError):
                    debugPrint(apiError.rawValue)
                }
                semaphore.signal()
            }
            
            semaphore.wait()
        }
        
    }
}
