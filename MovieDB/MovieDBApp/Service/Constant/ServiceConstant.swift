//
//  ServiceConstant.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

import Foundation

typealias Parameters = [String:Any]
typealias HTTPHeaders = [String:Any]
typealias NetworkRequestCompletion = (_ data: Data?,_ response: URLResponse?,_ error: ServiceErrors?)->()

final class ServiceConstant {
    private init() {}
    
    static var baseUrl = "https://api.themoviedb.org/3"
}

