//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharactersViewController: BaseViewController, StoryboardLoadable, CharactersView {
    
    static var storyboardId = "CharactersViewController"
    static var storyboardName = "Main"
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: CharactersPresenter!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Characters Marvel"
        presenter.start()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 160, height: 242)

        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CharacterCell.nib, forCellWithReuseIdentifier: CharacterCell.reuseID)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
