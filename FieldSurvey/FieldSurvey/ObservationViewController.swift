//
//  FieldSurvey
//
//  Created by Stelios Fikas
//
import UIKit

// View Controller
class ObservationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // IBOutlet
    @IBOutlet weak var observationTableView: UITableView!
    
    let creatureObservations = ObservationsJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Field Survey"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        // Cell control
        if let cell = cell as? ObservationTableViewCell {
            let creatureObservation = creatureObservations[indexPath.row]
            cell.observationIconImageView.image = creatureObservation.classification.image
            cell.titleLabel.text = creatureObservation.title
            cell.dateLabel.text = dateFormatter.string(from: creatureObservation.date)
        }
        // Return the corresponding cell
        return cell
    }
    
    // Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatureObservations.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
            let row = observationTableView.indexPathForSelectedRow?.row {
            destination.creatureObservation = creatureObservations[row]
        }
    }
}
