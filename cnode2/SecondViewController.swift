//
//  SecondViewController.swift
//  cnode2
//
//  Created by shuironglin on 2019/6/20.
//  Copyright © 2019 shuironglin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UITableViewController {
    var topics = [Topic]()
    
    struct TableView {
        struct CellIdentifiers {
            static let TopicItemCell = "TopicItemCell"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellNib = UINib(nibName: TableView.CellIdentifiers.TopicItemCell,bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.TopicItemCell)
        
        Alamofire.request("https://cnodejs.org/api/v1/topics").responseJSON { response in
            if let json = response.result.value {
                let data = JSON(json)["data"]
                for index in data{
                    let temp = index.1
                    
                    let topic = Topic(userName: temp["author"]["loginname"].stringValue, title: temp["title"].stringValue, time: temp["create_at"].stringValue, avatar: temp["author"]["avatar_url"].stringValue)
                    self.topics.append(topic)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.TopicItemCell, for: indexPath) as! TopicItemCell
        let topic = topics[indexPath.row]
        
        cell.title.text = topic.title
        cell.userName.text = topic.userName
        cell.topicTime.text = topic.time
//        let url = URL(string:topic.avatar)
//        let data = try! Data(contentsOf: url!)
//        cell.avatar.image = UIImage(data: data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

