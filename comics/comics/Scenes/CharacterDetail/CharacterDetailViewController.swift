//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class CharacterDetailViewController: BaseViewController, StoryboardLoadable, CharacterDetailView {
    
    static var storyboardId = "CharacterDetailViewController"
    static var storyboardName = "Main"
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CharacterDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = presenter.characterName()
        prepareTable()
        presenter.start()
        
    }
    
    private func prepareTable() {
        tableView.dataSource = presenter
        tableView.delegate = presenter
        ComicCell.register(tableView)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
