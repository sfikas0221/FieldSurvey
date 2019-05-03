//
//  FieldSurvey
//
//  Created by Stelios Fikas
//

import UIKit

// The view of the table cells
class ObservationTableViewCell: UITableViewCell {
    
    // IBOutlets
    @IBOutlet weak var observationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

