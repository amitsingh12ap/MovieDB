//  
//  ServiceErrors.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import Foundation

enum ServiceErrors: String, Error {
    case invalidUrl     = "Please Enter a Valid Url"
    case invalidRequest = "OOPs...Looks like not a valid request"
    case encodingFailed = "Something went wrong with response. Please try again later."
    case badRequest     = "Looks like its a bad request"
    case sslHandshakeError   = "Please review the certificate issue"
}
