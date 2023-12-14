//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

protocol CharacterDetailPresenter: Presenter, UITableViewDataSource, UITableViewDelegate {
    var view: CharacterDetailView! { get set }
    var router: CharacterDetailRouter! { get set }
    func start()
    func characterName() -> String
}

protocol CharacterDetailView: BaseViewController {
    func reloadData()
}

protocol CharacterDetailRouter: Router {

}
