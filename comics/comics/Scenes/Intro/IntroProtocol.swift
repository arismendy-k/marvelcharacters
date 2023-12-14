//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

protocol IntroPresenter: Presenter {
    var view: IntroView! { get set }
    var router: IntroRouter! { get set }
    func toCharacters()
}

protocol IntroView: BaseViewController {
	
}

protocol IntroRouter: Router {
    func toCharacterts()
}
