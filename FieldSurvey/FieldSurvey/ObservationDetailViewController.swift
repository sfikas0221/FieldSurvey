//
//  FieldSurvey
//
//  Created by Stelios Fikas
//

import UIKit

class ObservationDetailViewController: UIViewController {
    
    var creatureObservation: Observations?
    var dateFormatter = DateFormatter()
    
    // All the IBOutlets
    @IBOutlet weak var observationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // Override function when view loads
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Observation"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        // Image View
        observationIconImageView.image = creatureObservation?.classification.image
        titleLabel.text = creatureObservation?.title
        
        if let date = creatureObservation?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
        descriptionTextView.text = creatureObservation?.description
    }
}
