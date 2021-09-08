//
//  CarCell.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 24/07/21.
//

import UIKit
import Kingfisher

class CarCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imgCar: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSmallDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imgCar.addBlackGradientLayerInBackground(frame: contentView.bounds, colors: [.clear, .black])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCarDataIntoCell(carViewModel: CarViewModel) {
       
        if let strUrl = carViewModel.content.image?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let imgUrl = URL(string: strUrl) {
            imgCar.kf.setImage(with: imgUrl)
        }
        
        lblTitle.text = carViewModel.title
        lblDate.text = "\(carViewModel.date)"
        lblSmallDescription.text = carViewModel.description
    }

}



