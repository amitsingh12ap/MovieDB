//
//  HomeService.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation

class HomeService: MoviesServiceProtocol {
    var params: Parameters = ["api_key": "a990e4a568bb4ec35494db1273576210"]
    
    private init(){}
    
    static let shared = HomeService()

    func fetchTrendingMovies(_ completion: @escaping ((Result<TrendingMovieModel?, ServiceErrors>) -> Void)) {
        Service.shared.callApi(with: .trending, parameters: &params, headers: nil, requestType: .get) { (data, response, error) in
            if let apiError = error {
                completion(.failure(apiError))
            } else {
                guard let responseData = data else {
                    if let httpResponse = response as? HTTPURLResponse {
                        completion(.failure(Utils.getErrorMessageForApiResponseCode(httpResponse)))
                    } else {
                        completion(.failure(.badRequest))
                    }
                    return
                }
                if let responseModel = responseData.decode(modelType: TrendingMovieModel.self) {
                    completion(.success(responseModel))
                } else {
                    completion(.failure(.encodingFailed))
                }
            }
        }
    }
    
    func fetchNowPlayingMovies(_ completion: @escaping (Result<NowPlayingMovieModel?, ServiceErrors>) -> Void) {
        Service.shared.callApi(with: .nowPlaying, parameters: &params, headers: nil, requestType: .get) { (data, response, error) in
            if let apiError = error {
                completion(.failure(apiError))
            } else {
                guard let responseData = data else {
                    if let httpResponse = response as? HTTPURLResponse {
                        completion(.failure(Utils.getErrorMessageForApiResponseCode(httpResponse)))
                    } else {
                        completion(.failure(.badRequest))
                    }
                    return
                }
                if let responseModel = responseData.decode(modelType: NowPlayingMovieModel.self) {
                    completion(.success(responseModel))
                } else {
                    completion(.failure(.encodingFailed))
                }
            }
        }
    }
    
    func fetchTopratedMovies(_ completion: @escaping (Result<TopRatedMovieModel?, ServiceErrors>) -> Void) {
        Service.shared.callApi(with: .topRated, parameters: &params, headers: nil, requestType: .get) { (data, response, error) in
            if let apiError = error {
                completion(.failure(apiError))
            } else {
                guard let responseData = data else {
                    if let httpResponse = response as? HTTPURLResponse {
                        completion(.failure(Utils.getErrorMessageForApiResponseCode(httpResponse)))
                    } else {
                        completion(.failure(.badRequest))
                    }
                    return
                }
                if let responseModel = responseData.decode(modelType: TopRatedMovieModel.self) {
                    completion(.success(responseModel))
                } else {
                    completion(.failure(.encodingFailed))
                }
            }
        }
    }
}
