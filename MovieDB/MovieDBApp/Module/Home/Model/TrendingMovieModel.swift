//
//  TrendingMovieModel.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation

// MARK: - TrendingMovieModel
struct TrendingMovieModel: Codable {
    let page: Int
    let results: [TrendingMovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TrendingMovieResult: Codable,Identifiable {
    let backdropPath: String
    let genreIDS: [Int]
    let releaseDate: String?
    let originalLanguage: String?
    let originalTitle: String?
    let posterPath: String
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let title: String?
    let id: Int
    let overview: String
    let adult: Bool?
    let popularity: Double
    let mediaType: MediaType
    let name, originalName: String?
    let originCountry: [String]?
    let firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case title, id, overview, adult, popularity
        case mediaType = "media_type"
        case name
        case originalName = "original_name"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}
