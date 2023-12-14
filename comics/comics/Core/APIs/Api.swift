//
//  Api.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

protocol API: APIClient {
    
    func getCharacters(callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void)
    
    func getCharacter(id: Int, callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void)
    
    func getComics(characterId: Int, callback: @escaping (Result<ComicDataWrapper, APIError>) -> Void)
    
}

class APIImpl: API {
    var baseURL: URL
    var decoder: JSONDecoder = JSONDecoder()
    let urlSession: URLSession = {
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 180
        session.configuration.timeoutIntervalForResource = 180
        return session
    }()
    let commonHeaders: [String: String] = [:]
    let commonParameters: [String: String] = [:]
    
    private static var initialBaseUrl: URL?
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    var charectersParameters: [String: String] {
        [ "ts": Marvel.timeStamp,
          "apikey": Marvel.apiKey,
          "hash": Marvel.hash,
          "limit": "50",
          "offset": "0",
          "orderBy": "name"
        ]
    }
    
    var comicParameters: [String: String] {
        [ "ts": Marvel.timeStamp,
          "apikey": Marvel.apiKey,
          "hash": Marvel.hash,
          "limit": "50",
          "offset": "0",
          "orderBy": "title"
        ]
    }
        
    func getCharacters(callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void) {
        let path = "characters"
        get(path: path,
            parameters: charectersParameters,
            callback: callback )
    }
    
    func getCharacter(id: Int, callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void) {
        let path = "characters/\(id)"
        get(path: path,
            parameters: charectersParameters,
            callback: callback )
    }
    
    func getComics(characterId: Int, callback: @escaping (Result<ComicDataWrapper, APIError>) -> Void) {
        let path = "characters/\(characterId)/comics"
        get(path: path,
            parameters: comicParameters,
            callback: callback )
    }

}
