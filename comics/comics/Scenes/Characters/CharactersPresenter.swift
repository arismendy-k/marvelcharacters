//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharactersPresenterImpl: NSObject, Presenter, CharactersPresenter {
    
    var router: CharactersRouter!
    weak var view: CharactersView!
    
    private let repository: APIRepository
    
    init(repository: APIRepository = Repository.shared.instance) {
        self.repository = repository
    }
    
    var data: CharacterDataWrapper?
    var characters = [Character]() {
        didSet { view.reloadData() }
    }
}

// MARK: - CharactersPresenter
extension CharactersPresenterImpl {
    
    func start() {
        view.loadingOn()
        repository.getCharacters { res in
            self.view.loadingOff()
            switch res {
            case .success(let data):
                self.data = data
                self.characters = data.data?.results ?? []
            case .failure(let error):
                self.view.showAlert(message: self.info(error))
            }
        }
    }
}

extension CharactersPresenterImpl: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
        let item = characters[indexPath.row]
        cell.configure(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = characters[indexPath.row]
        router.toCharacterDetail(character: item)
    }
}
