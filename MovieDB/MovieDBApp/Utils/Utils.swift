//
//  Utils.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import UIKit

struct Utils {
    static func getErrorMessageForApiResponseCode(_ httpResponse: HTTPURLResponse)-> ServiceErrors {
        let httpStatus = HTTPStatusCode(rawValue: httpResponse.statusCode)
        switch httpStatus {
        case .badRequest:
            return ServiceErrors.badRequest
        case .SSLCertificateRequired:
            return ServiceErrors.sslHandshakeError
        default:
            return ServiceErrors.encodingFailed
        }
    }
    
    
    static func getSize(_ thumbnailType: ThumbnailType)->(width: CGFloat, height: CGFloat) {
        switch thumbnailType {
        case .pager:
            return (200,100)
        case .big:
            return (200,80)
        default:
            return (100,100)
        }
    }
}
