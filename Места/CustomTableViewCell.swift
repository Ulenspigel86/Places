//
//  CustomTableViewCell.swift
//  Места
//
//  Created by Ulenspigel on 29.08.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {//этот класс отвечет за настройки ячейки

    @IBOutlet weak var imageOfPlace: UIImageView! //аутлет отвечающий за изображение в ячейке
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    

}
