//
//  ApiClient.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

protocol APIClient: AnyObject {
    var decoder: JSONDecoder { get }
    var urlSession: URLSession { get }
    var commonParameters: [String: String] { get }
    var commonHeaders: [String: String] { get }
    var baseURL: URL { get }
}

extension APIClient {
    
    func getCommonParams(with parameters: [String: String]) -> [String: String] {
        return parameters.reduce(commonParameters, { var xVar = $0; xVar[$1.key] = $1.value; return xVar })
    }
    
    func getCommonHeaders(with headers: [String: String]) -> [String: String] {
        return headers.reduce(commonHeaders, { var xVar = $0; xVar[$1.key] = $1.value; return xVar })
    }
    
    private func send<T: Codable>(with request: APIRequest<T>, callback: @escaping (Result<T, APIError>) -> Void) {
        let decoder = self.decoder
            
        urlSession.dataTask(with: request.urlRequest) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if 200..<300 ~= httpResponse.statusCode, let data = data {
                    do {
                        let dataResult = data.count == 0 ? "{}".data(using: .utf8)! : data
                        let deserialized = try decoder.decode(T.self, from: dataResult)
                        DispatchQueue.main.async {
                            callback(.success(deserialized))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            callback(.failure(APIError.canNotDecode(data, request.urlRequest)))
                        }
                    }
                } else if httpResponse.statusCode == 401 {
                    DispatchQueue.main.async {
                        callback(.failure(.invalidCredencials))
                    }
                } else if let data = data {
                    print(httpResponse.statusCode)
                    do {
                        let deserialized = try decoder.decode(ErrorModel.self, from: data)
                        DispatchQueue.main.async {
                            callback(.failure(.api(errorModel: deserialized)))
                        }
                    } catch {
                        let infoError = NSError(domain: httpResponse.description, code: httpResponse.statusCode, userInfo: httpResponse.allHeaderFields as? [String: Any])
                        let error = APIError.request(code: httpResponse.statusCode, request: request.urlRequest, error: infoError)
                        DispatchQueue.main.async {
                            callback(.failure(error))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        callback(.failure(APIError.unknown(request: request.urlRequest)))
                    }
                }
            }
        }.resume()
        
    }
    
    func get<T: Codable>(path: String,
                         parameters: [String: String] = [:],
                         headers: [String: String] = [:],
                         callback: @escaping (Result<T, APIError>) -> Void) {
        let request = APIRequest<T>(method: .get,
                                    baseURL: baseURL,
                                    path: path,
                                    parameters: getCommonParams(with: parameters),
                                    headers: getCommonHeaders(with: headers))
        send(with: request, callback: callback)
    }
    
}

