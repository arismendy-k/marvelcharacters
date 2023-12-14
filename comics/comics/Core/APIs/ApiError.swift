//
//  ApiError.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

public enum APIError: Error {
    case invalidCredencials
    case request(code: Int, request: URLRequest, error: Error?)
    case canNotDecode(Data, URLRequest)
    case unknown(request: URLRequest)
    case api(errorModel: ErrorModel)
}

public struct ErrorModel: Codable {
    let code: Int?
    let status: String?
}
