//
//  Presenter.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation
import UIKit

@objc protocol Presenter: AnyObject {
    @objc optional func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension Presenter {
    
    func info(_ error: APIError) -> String {
        if case let APIError.api(errorModel: err) = error {
            return err.status.noNil
        }
        
        if case APIError.canNotDecode = error {
            return "Error fail decode"
        }
       
        if case APIError.invalidCredencials = error {
            return "Error bad credentials"
        }
        return "Error conection server"
    }
}
