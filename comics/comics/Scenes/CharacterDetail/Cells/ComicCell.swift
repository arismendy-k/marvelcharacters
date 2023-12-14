//
//  ComicCell.swift
//  comics
//
//  Created by K on 14/12/23.
//

import UIKit
import SDWebImage

class ComicCell: UITableViewCell, NibLoadable {
    static var reuseID = "ComicCell"

    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var comicText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func register(_ tableView: UITableView) {
        tableView.register(ComicCell.nib, forCellReuseIdentifier: ComicCell.reuseID)
    }
    
    func configure(_ comic: Comic) {
        comicName.text = comic.title.noNil
        comicText.text = comic.description.noNil
        guard let t = comic.thumbnail, let p = t.path, let e = t.ext, let url = URL(string: "\(p).\(e)") else { return }
        comicImage.sd_setImage(with: url)
        comicImage.contentMode = .scaleToFill
    }
    
}
