//
//  MoviesServiceProtocol.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation
protocol MoviesServiceProtocol {
    var params: Parameters {get set}
    
    func fetchTrendingMovies(_ completion: @escaping ((Result<TrendingMovieModel?, ServiceErrors>) -> Void))
    func fetchNowPlayingMovies(_ completion: @escaping (Result<NowPlayingMovieModel?, ServiceErrors>) -> Void)
    func fetchTopratedMovies(_ completion: @escaping (Result<TopRatedMovieModel?, ServiceErrors>) -> Void)
}
