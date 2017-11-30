//
//  GOTTableViewController.swift
//  ParsingJSONGOT-Codable
//
//  Created by C4Q  on 11/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTTableViewController: UITableViewController {
    var episodes = [GOTEpisode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEpisodeData()
    }
    
    func loadEpisodeData() {
        if let path = Bundle.main.path(forResource: "gameofthronesinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let episodes = try myDecoder.decode([GOTEpisode].self, from: data)
                    self.episodes = episodes
                }
                catch let error {
                    print(error)
                }
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath)
        cell.textLabel?.text = episodes[indexPath.row].name
        return cell
    }
}
