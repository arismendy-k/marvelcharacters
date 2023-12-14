//
// Copyright © 2023 Carlos Arismendy. All rights reserved.
//

import UIKit

final class IntroViewController: BaseViewController, StoryboardLoadable, IntroView {
    
    static var storyboardId = "IntroViewController"
    static var storyboardName = "Main"
    
    // Outlets
    @IBOutlet weak var btnStart: UIButton!
    
    var presenter: IntroPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStart.addTarget(self, action: #selector(actionStart), for: .touchUpInside)
    }
    
    @objc func actionStart() {
        presenter.toCharacters()
    }
}
