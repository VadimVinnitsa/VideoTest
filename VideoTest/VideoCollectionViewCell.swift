//
//  VideoCollectionViewCell.swift
//  VideoTest
//
//  Created by Admin on 15/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell1"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let posterImageView: UIImageView = {
        
        let image = UIImageView()
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let movieName: UILabel = {
        
        let name = UILabel()
      name.font = UIFont.preferredFont(forTextStyle: .body)
        name.textColor = .red
        name.numberOfLines = 2
      //  name.text = "Привет, как дела? че там кого?"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
        
    }()
    
    let movieYear: UILabel = {
        
        let year = UILabel()
        year.font = UIFont.preferredFont(forTextStyle: .body)
        year.textColor = .green
     //   year.text = "2018"
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
        
    }()
    
    func setup() {
        
        addSubview(posterImageView)
        addSubview(movieName)
        addSubview(movieYear)
        
        //MARK: - Constraints cell items
        let views = ["poster": posterImageView, "nameLbl": movieName, "yearLbl": movieYear]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[poster]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[nameLbl]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[yearLbl]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[poster(180)][nameLbl][yearLbl]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        
    }

    
    
}
