//
//  DataExtension.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation

extension Data {
    func decode<T>(modelType: T.Type) -> T? where T : Decodable {
        return try? JSONDecoder().decode(modelType, from: self)
    }
}
