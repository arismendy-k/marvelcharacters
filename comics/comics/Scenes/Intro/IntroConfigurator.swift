//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

struct IntroConfigurator {
    
    static func getController() -> IntroViewController {
        let viewController = IntroViewController.loadFromStoryboard()
        viewController.presenter = IntroPresenterImpl()
        viewController.presenter.view = viewController
        let router = IntroRouterImpl(viewController: viewController)
        viewController.presenter.router = router
        return viewController
    }
}
