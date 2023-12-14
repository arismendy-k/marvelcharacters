//
//  Loadables.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation
import UIKit

protocol StoryboardLoadable: AnyObject {
    static var storyboardId: String { get }
    static var storyboardName: String { get }
}

extension StoryboardLoadable {
    
    static func loadFromStoryboard() -> Self {
        return UIStoryboard(name: storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: storyboardId) as! Self
    }
}

protocol NibLoadable: AnyObject {
    static var reuseID: String { get }
    static var nib: UINib { get }
    static func loadFromNib() -> Self
}

extension NibLoadable {
    
    static var nib: UINib {
        UINib(nibName: reuseID, bundle: nil)
    }
    
    static func loadFromNib() -> Self {
        nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}
