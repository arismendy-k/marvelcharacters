//
//  ext+Optional.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation

extension Optional where Wrapped == String {
    
  var noNil: String { self ?? ""}
    
}
