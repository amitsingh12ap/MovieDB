//
//  ServiceProtocols.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//
import Foundation


protocol ServiceProtocol {
    func callApi(with endPoint: ServiceEndpoints, parameters:inout Parameters, headers: HTTPHeaders?, requestType: ServiceHttpMethod, completion: @escaping NetworkRequestCompletion)
}
extension ServiceProtocol {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else {
            throw ServiceErrors.invalidRequest
        }
        if var urlComponent =  URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponent.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponent.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponent.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded;charset-utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
}
