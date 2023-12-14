//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

struct CharactersConfigurator {
    
    static func getController() -> CharactersViewController {
        let viewController = CharactersViewController.loadFromStoryboard()
        viewController.presenter = CharactersPresenterImpl()
        viewController.presenter.view = viewController
        let router = CharactersRouterImpl(viewController: viewController)
        viewController.presenter.router = router
        return viewController
    }
}
