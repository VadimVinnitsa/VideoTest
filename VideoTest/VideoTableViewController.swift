//
//  VideoTableViewController.swift
//  VideoTest
//
//  Created by Admin on 15/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {
    var company = [Company]()

  
    override func viewDidLoad() {
        super.viewDidLoad()

        print("video did load")
      setup()
    }

    func setup() {
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: VideoTableViewCell.identifier)
        let mov1 = Movie(poster: "1", name : "1df", year: "1998")
        let mov2 = Movie(poster: "2", name : "2df", year: "2011")
        let mov3 = Movie(poster: "3", name : "3df", year: "1587")
        let mov4 = Movie(poster: "3", name : "4df", year: "5487")
        let mov5 = Movie(poster: "3", name : "5df", year: "5787")
        
        let array = [mov1, mov2, mov3, mov4, mov5]
        let com1 = Company(name: "sdf", movies: array)
        company.append(com1)
        company.append(com1)
        company.append(com1)
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return company.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier, for: indexPath) as! VideoTableViewCell
        cell.companyNameLable.text = company[indexPath.row].name
        cell.movies = company[indexPath.row].movies
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    

}
