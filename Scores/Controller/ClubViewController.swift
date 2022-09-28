//
//  ClubViewController.swift
//  Scores
//
//  Created by Zaid Alderi on 27/09/2022.
//

import UIKit

class ClubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clubCountry: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubLogo: UIImageView!
    
    var form: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "formCell")
    
        
        print("Form in ClubVC: \(form)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell") as! FormCell
        var formArray = [Character]()
        DispatchQueue.main.async {
            for game in self.form! {
                formArray.append(game)
            }
            cell.formView.layer.cornerRadius = cell.formView.frame.height / 7
            cell.game1Label.text = String(formArray[4])
            cell.game1Label.backgroundColor = self.getBackgroundColor(result: String(formArray[4]))
            cell.game2Label.text = String(formArray[3])
            cell.game2Label.backgroundColor = self.getBackgroundColor(result: String(formArray[3]))
            cell.game3Label.text = String(formArray[2])
            cell.game3Label.backgroundColor = self.getBackgroundColor(result: String(formArray[2]))
            cell.game4Label.text = String(formArray[1])
            cell.game4Label.backgroundColor = self.getBackgroundColor(result: String(formArray[1]))
            cell.game5Label.text = String(formArray[0])
            cell.game5Label.backgroundColor = self.getBackgroundColor(result: String(formArray[0]))
        }
        return cell
    }
    
    func getBackgroundColor(result: String) -> UIColor {
        if result == "W" {
            return UIColor(red: 0.08, green: 0.60, blue: 0.37, alpha: 1.00)
        } else if result == "L" {
            return UIColor(red: 0.90, green: 0.37, blue: 0.36, alpha: 1.00)
        } else {
            return UIColor(red: 0.55, green: 0.58, blue: 0.60, alpha: 1.00)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
