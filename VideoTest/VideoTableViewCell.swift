//
//  VideoTableViewCell.swift
//  VideoTest
//
//  Created by Admin on 15/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

static let identifier = "cell"
   
    
    var movies = [Movie]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupVideoTableViewCell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let companyNameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.textColor = .blue
        nameLable.font = UIFont.preferredFont(forTextStyle: .caption1)
        nameLable.text = "Hellow"
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        return nameLable
    }()
    
    let moreButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Ещё >", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let movieCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    
    func setupVideoTableViewCell() {
        
        backgroundColor = .clear
        
        addSubview(companyNameLable)
        addSubview(moreButton)
        addSubview(movieCollectionView)
        
        movieCollectionView.backgroundColor = .clear
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
        movieCollectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        
        //MARK: - Constraints cell items
        let views = ["companyNameLable": companyNameLable, "moreButton": moreButton, "collectionView": movieCollectionView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[companyNameLable]-[moreButton]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[moreButton]-5-[collectionView]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[companyNameLable]-10-[collectionView]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        
    }
    
}

extension VideoTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
        cell.posterImageView.image = UIImage(named: movies[indexPath.row].poster)
        cell.movieName.text = movies[indexPath.row].name
        cell.movieYear.text = movies[indexPath.row].year
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 40) / 3, height: frame.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 12, bottom: 14, right: 12)
    }
    
}
