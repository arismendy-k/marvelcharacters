//
//  Router.swift
//  comics
//
//  Created by K on 13/12/23.
//

import Foundation

protocol Router: AnyObject {
    typealias ViewController = BaseViewController
    var viewController: ViewController! { get }
}

extension Router {
    
}
