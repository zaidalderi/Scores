//
//  ViewController.swift
//  Scores
//
//  Created by Zaid Alderi on 18/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var standingsArray = [Standing]()
    
    var footballManager = FootballManager()
    
    var clubStanding: Standing?
    
    var country: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        footballManager.delegate = self
        footballManager.performRequest()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StandingsCell", bundle: nil), forCellReuseIdentifier: "standingsCell")
    }
}


//MARK: - FootballManagerDelegate

extension ViewController: FootballManagerDelegate {
    func didUpdateStandings(_ footballManager: FootballManager, standings: FootballModel) {
        DispatchQueue.main.async {
            //self.clubsArray = standings.clubName
            self.populateArray(standings: standings)
            self.country = standings.country
            self.tableView.reloadData()
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func populateArray(standings: FootballModel){
        for i in 0..<1 {
            for j in 0...standings.clubName[0].count-1 {
                self.standingsArray.append(Standing(clubName: standings.clubName[i][j].team.name, logoURL: standings.clubName[i][j].team.logo, points: String(standings.clubName[i][j].points), gamesPlayed: String(standings.clubName[i][j].all.played), wins: String(standings.clubName[i][j].all.win), draws: String(standings.clubName[i][j].all.draw), defeats: String(standings.clubName[i][j].all.lose), form: standings.clubName[i][j].form))
            }
        }
    }
}

//MARK: - UITabelViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "standingsCell", for: indexPath) as! StandingsCell
        cell.clubLogo.load(url: URL(string: standingsArray[indexPath.row].logoURL)!)
        cell.label1.text = standingsArray[indexPath.row].clubName
        cell.label2.text = standingsArray[indexPath.row].gamesPlayed
        cell.label3.text = standingsArray[indexPath.row].wins
        cell.label4.text = standingsArray[indexPath.row].draws
        cell.label5.text = standingsArray[indexPath.row].defeats
        cell.label6.text = standingsArray[indexPath.row].points
        tableView.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingsArray.count;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clubStanding = standingsArray[indexPath.row]
        performSegue(withIdentifier: "toClubVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClubVC" {
            let destinationVC = segue.destination as! ClubViewController
            DispatchQueue.main.async {
                destinationVC.clubName.text = self.clubStanding!.clubName
                destinationVC.clubLogo.load(url: URL(string: self.clubStanding!.logoURL)!)
                destinationVC.form = self.clubStanding!.form
                destinationVC.clubCountry.text = self.country
                print("Form in ViewController: \(self.clubStanding!.form)")
            }
        }
    }
}

//MARK: - UIImageView
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                }
            }
        }
    }
}

