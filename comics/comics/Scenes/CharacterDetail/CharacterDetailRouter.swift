//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharacterDetailRouterImpl: Router, CharacterDetailRouter {
    
    weak var viewController: Router.ViewController!
    
    init(viewController: Router.ViewController) {
        self.viewController = viewController
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
