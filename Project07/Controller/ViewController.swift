//
//  ViewController.swift
//  Project07
//
//  Created by Edwin Cardenas on 2/1/23.
//

import UIKit

class ViewController: UITableViewController, PetitionsManagerDelegate {

    var petitionsManager = PetitionsManager()
    var petitions = [Petition]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        petitionsManager.delegate = self
        petitionsManager.fetchPetitions()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petition = petitions[indexPath.row]
        
        let vc = DetailVC()
        vc.detailItem = petition
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didUpdatePetitions(_ petitionsManager: PetitionsManager, petitions: Petitions) {
        DispatchQueue.main.async {
            self.petitions = petitions.results
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

