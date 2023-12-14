//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class IntroRouterImpl: Router, IntroRouter {

    weak var viewController: Router.ViewController!
    
    init(viewController: Router.ViewController) {
        self.viewController = viewController
    }
    
    func toCharacterts() {
        let newViewController = CharactersConfigurator.getController()
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}
