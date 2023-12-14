//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class IntroPresenterImpl: NSObject, Presenter, IntroPresenter {
  
    var router: IntroRouter!
    weak var view: IntroView!
    
}

// MARK: - IntroPresenter
extension IntroPresenterImpl {
    
    func toCharacters() {
        router.toCharacterts()
    }
}
