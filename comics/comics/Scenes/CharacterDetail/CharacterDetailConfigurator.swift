//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

struct CharacterDetailConfigurator {
    
    static func getController(character: Character) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController.loadFromStoryboard()
        viewController.presenter = CharacterDetailPresenterImpl(character: character)
        viewController.presenter.view = viewController
        let router = CharacterDetailRouterImpl(viewController: viewController)
        viewController.presenter.router = router
        return viewController
    }
}
