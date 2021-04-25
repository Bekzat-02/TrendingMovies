//
//  MovieCell.swift
//  SecondAssignment
//
//  Created by admin on 24.04.2021.
//

import UIKit

class MovieCell: UITableViewCell {
        
    public static let identifier: String="MovieCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet private weak var ratingContainerView: UIView!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var realiseDateLabel: UILabel!

    public var movie: String?{
        didSet{
            if let movie = movie {
                //add later
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        posterImageView.layer.cornerRadius = 12
        posterImageView.layer.masksToBounds = true
        ratingContainerView.layer.cornerRadius = 20
        ratingContainerView.layer.masksToBounds=true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
