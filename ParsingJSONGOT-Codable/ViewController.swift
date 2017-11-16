//
//  ViewController.swift
//  ParsingJSONGOT-Codable
//
//  Created by C4Q  on 11/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var episodes = [GOTEpisode]()
    var pods = [Pod]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadEpisodeData()
        loadPodData()
        for pod in pods {
            print(pod.episodes, pod.podcast)
        }
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
}

