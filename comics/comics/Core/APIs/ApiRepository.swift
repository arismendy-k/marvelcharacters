//
//  ApiRepository.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

public protocol APIRepository {
    
    func getCharacters(callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void)
    
    func getCharacter(id: Int, callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void)
    
    func getComics(characterId: Int, callback: @escaping (Result<ComicDataWrapper, APIError>) -> Void)
}


public class APIRepositoryImp: APIRepository {

    private let api: API
    
    public init() {
        let urlString = "\(Marvel.url)\(Marvel.path)"
        guard let baseUrl = URL(string: urlString) else { fatalError("Invalid path Marvel") }
        api = APIImpl(baseURL: baseUrl)
    }
    
    public func getCharacters(callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void) {
        api.getCharacters(callback: callback)
    }
    
    public func getCharacter(id: Int, callback: @escaping (Result<CharacterDataWrapper, APIError>) -> Void) {
        api.getCharacter(id: id, callback: callback)
    }
    
    public func getComics(characterId: Int, callback: @escaping (Result<ComicDataWrapper, APIError>) -> Void) {
        api.getComics(characterId: characterId, callback: callback)
    }
}


final class Repository {
    
    static let shared = Repository()
    
    private(set) lazy var instance: APIRepository = {
        APIRepositoryImp()
    }()
    
    private init() {}
    
}
