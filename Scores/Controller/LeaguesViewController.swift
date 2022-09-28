//
//  LeaguesViewController.swift
//  Scores
//
//  Created by Zaid Alderi on 27/09/2022.
//

import UIKit

class LeaguesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let logoArray: [String] = ["plLogo","bundesliga","laliga","seria","ligue1"]
    let leagueArray: [String] = ["Premier League","Bundesliga","LaLiga","Serie A","Ligue 1"]
    
    var choosenLeague: String?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell") as! LeagueCell
        cell.logoImage.image = UIImage(named: logoArray[indexPath.row])
        cell.leagueLabel.text = leagueArray[indexPath.row]
        
        cell.leagueView.layer.cornerRadius = cell.leagueView.frame.height / 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLeague = leagueArray[indexPath.row]
        performSegue(withIdentifier: "toLeagueStandings", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLeagueStandings" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.footballManager.leagueName = choosenLeague
        }
    }

}
