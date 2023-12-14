//
//  CharacterCell.swift
//  comics
//
//  Created by K on 14/12/23.
//

import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell, NibLoadable {
    
    static var reuseID = "CharacterCell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ item: Character) {
        name.text = item.name.noNil
        guard let t = item.thumbnail, let p = t.path, let e = t.ext, let url = URL(string: "\(p).\(e)") else { return }
        image.sd_setImage(with: url)
        image.contentMode = .scaleToFill
    }
}
