//
//  Constants.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation
import CommonCrypto

struct Marvel {
 
    static let publicKey = "0394eb8c8d2441b6289aa92d1a087ebd"
    
    static let privateKey = "54d06c92943ba5cf9e5f7b7f4643871c6d68e150"
    
    static let url = "https://gateway.marvel.com/"
  
    static let path = "v1/public"
  
    static let timeStamp = "\(Date().timeIntervalSince1970)"
    
    static var apiKey: String { Marvel.publicKey }
    
    static var hash: String { "\(Marvel.timeStamp)\(Marvel.privateKey)\(Marvel.publicKey)".md5 }
}
