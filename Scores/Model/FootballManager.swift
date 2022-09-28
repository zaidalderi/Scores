//
//  FootballManager.swift
//  Scores
//
//  Created by Zaid Alderi on 19/09/2022.
//

import Foundation

protocol FootballManagerDelegate {
    
    func didUpdateStandings(_ footballManager: FootballManager,standings: FootballModel)
    func didFailWithError(error: Error)
}
struct FootballManager {
    
    var delegate: FootballManagerDelegate?
    
    var leagueName: String!
    
    var legaueID : String {
        switch leagueName {
        case "Premier League":
            return "39"
        case "Ligue 1":
            return "61"
        case "Bundesliga":
            return "78"
        case "Serie A":
            return "135"
        case "LaLiga":
            return "140"
        default:
            return ""
        }
    }
    
    func performRequest(){
        
        var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/standings?league=\(legaueID)&season=2022")!,timeoutInterval: Double.infinity)
        request.addValue("639248abcf96cbcebd90cd66aec49db4", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            
            if let safeData = data{
                if let standings = self.parseJSON(safeData) {
                    delegate?.didUpdateStandings(self, standings: standings)
                }else {
                    print("eee")
                }
            }
        }
        
        //4. Start the task
        task.resume()
    }
    
    func parseJSON(_ footballData: Data) -> FootballModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FootballData.self, from: footballData)
            let name = decodedData.response[0].league.standings
            let country = decodedData.response[0].league.country
            let standings = FootballModel(clubName: name, country: country)
            return standings
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

