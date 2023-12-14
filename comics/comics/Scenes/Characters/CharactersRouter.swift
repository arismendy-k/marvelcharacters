//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharactersRouterImpl: Router, CharactersRouter {
    
    weak var viewController: Router.ViewController!
    
    init(viewController: Router.ViewController) {
        self.viewController = viewController
    }
    
    func toCharacterDetail(character: Character?) {
        guard let character = character else { return }
        let newViewController = CharacterDetailConfigurator.getController(character: character)
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}
