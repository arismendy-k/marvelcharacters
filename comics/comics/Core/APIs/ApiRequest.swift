//
//  ApiRequest.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

enum HTTPMethod: String {
    case get
}

enum ContentType {
    case none
}

struct EmptyObject: Codable { }

struct APIRequest<ResponseType: Codable> {
    
    public let method: HTTPMethod
    public let baseURL: URL
    public let path: String
    public let parameters: [String: String]
    public var headers: [String: String]
    public let bodyObjects: Codable
    public let bodyObjectsDict: [String: Codable]
    public let bodyData: Data?
    public let contentType: ContentType
    
    var getType: ResponseType.Type {
         ResponseType.self
    }
    
    var urlRequest: URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            else { fatalError("Unable to create URLComponents from url: \(url)") }
        
        if !parameters.isEmpty {
            components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1 ) }
        }
        guard let finalURL = components.url else { fatalError("Unable to retrieve final URL") }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue.uppercased()
        
        if !headers.isEmpty {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        switch contentType {
        case .none:
            break
        }
        
        if headers["Content-Type"] == nil {
            request.addValue("application/json; charset=utf-8;", forHTTPHeaderField: "Content-Type")
        }
        
        return request
    }
    
    public init(method: HTTPMethod,
                baseURL: URL,
                path: String,
                parameters: [String: String] = [:],
                headers: [String: String] = [:],
                bodyData: Data? = nil,
                bodyObjects: Codable = EmptyObject(),
                bodyObjectsDict: [String: Codable] = [:],
                contentType: ContentType = .none) {
        
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.parameters = parameters
        self.headers = headers
        self.bodyData = bodyData
        self.bodyObjects = bodyObjects
        self.bodyObjectsDict = bodyObjectsDict
        self.contentType = contentType
    }
    
}
