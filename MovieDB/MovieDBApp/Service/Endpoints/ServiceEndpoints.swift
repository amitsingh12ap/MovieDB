//
//  ServiceEndpoints.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation

enum ServiceEndpoints {
    case trending
    case nowPlaying
    case topRated
    var path : String {
        switch self {
        case .trending: return ServiceConstant.baseUrl+"/trending/all/day"
        case .nowPlaying: return ServiceConstant.baseUrl+"/movie/now_playing"
        case .topRated: return ServiceConstant.baseUrl+"/movie/top_rated"
        }
    }
} 
