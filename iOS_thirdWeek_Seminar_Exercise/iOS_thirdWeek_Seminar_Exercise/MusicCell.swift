//
//  MusicCell.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/11.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier : String = "MusicCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    func set(_ musicInformation : Music){
        albumImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
    
    
    
}
