//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Brian Lasker on 7/20/18.
//  Copyright © 2018 Brian Lasker. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let fieldSurveys = FieldSurveyJSONLoader.load(fileName: "field_observations")
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = "Field Survey"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell {
            let fieldSurvey = fieldSurveys[indexPath.row]
                cell.fieldSurveyIconImageView.image = fieldSurvey.classification.image
                cell.titleLabel.text = fieldSurvey.title
                cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = fieldSurveyTableView.indexPathForSelectedRow?.row,
            let destination = segue.destination as? FieldSurveyDetailViewController {
                destination.fieldSurvey = fieldSurveys[row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
