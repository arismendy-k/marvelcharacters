//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharacterDetailPresenterImpl: NSObject, Presenter, CharacterDetailPresenter {
        
    var router: CharacterDetailRouter!
    weak var view: CharacterDetailView!
    
    private let character: Character
    private let repository: APIRepository
    
    var comics = [Comic]() {
        didSet { view.reloadData() }
    }
    
    init(character: Character, repository: APIRepository = Repository.shared.instance) {
        self.repository = repository
        self.character = character
    }
    
}

// MARK: - CharacterDetailPresenter

extension CharacterDetailPresenterImpl {
    
    func start() {
        guard let id = character.id else { return }
        view.loadingOn()
        repository.getComics(characterId: id) { res in
            self.view.loadingOff()
            switch res {
            case .success(let data):
                self.comics = data.data?.results ?? []
                print(self.comics.count)
            case .failure(let error):
                self.view.showAlert(message: self.info(error))
            }
        }
    }
    
    func characterName() -> String {
        character.name.noNil 
    }
   
}

extension CharacterDetailPresenterImpl: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicCell.reuseID, for: indexPath) as? ComicCell else { return UITableViewCell() }
        let item = comics[indexPath.row]
        cell.configure(item)
        return cell
    }
    
}
