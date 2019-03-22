//
//  collectionViewCell.swift
//  OneFi-Movie
//
//  Created by Ayoola Samagbeyi on 21/03/2019.
//  Copyright © 2019 Ayoola Samagbeyi. All rights reserved.
//

import Foundation
import UIKit

internal class collectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var opaqueview: UIView!
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet internal var titlelabel: UILabel!
    @IBOutlet internal var directorlabel: UILabel!
    @IBOutlet internal var yearlabel: UILabel!
}
