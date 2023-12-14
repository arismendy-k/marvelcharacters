//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

protocol CharactersPresenter: Presenter, UICollectionViewDelegate, UICollectionViewDataSource {
    var view: CharactersView! { get set }
    var router: CharactersRouter! { get set }
    func start()
}

protocol CharactersView: BaseViewController {
    func reloadData()
}

protocol CharactersRouter: Router {
    func toCharacterDetail(character: Character?)
}
