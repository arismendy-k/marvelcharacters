//
//  ext+String.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation
import CommonCrypto

extension String {
    
    var md5: String {
        let str = cString(using: .utf8)
        let strLen = CUnsignedInt(lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str, strLen, result)
           
        let hash = NSMutableString()
        for index in 0..<digestLen {
            hash.appendFormat("%02x", result[index])
        }
        return String(format: hash as String)
    }
}
