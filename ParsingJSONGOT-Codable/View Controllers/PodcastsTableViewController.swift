//
//  PodcastsTableViewController.swift
//  ParsingJSONGOT-Codable
//
//  Created by C4Q  on 11/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class PodcastsTableViewController: UITableViewController {

    var pods = [Pod]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPodData()
    }

    func loadPodData() {
        if let path = Bundle.main.path(forResource: "podcastinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let allPodInfo = try myDecoder.decode(PodInfo.self, from: data)
                    self.pods = allPodInfo.pods
                }
                catch {
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
        return pods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podCell", for: indexPath)
        cell.textLabel?.text = pods[indexPath.row].podcast
        return cell
    }
}
