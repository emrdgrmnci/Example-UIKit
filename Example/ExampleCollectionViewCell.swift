//
//  ExampleCollectionViewCell.swift
//  Example
//
//  Created by Emre on 13.05.2023.
//

import UIKit

/// `ExampleCollectionViewCell` is a subclass of `UICollectionViewCell`.
/// This cell is designed to display onboarding items in a `UICollectionView`.
class ExampleCollectionViewCell: UICollectionViewCell {
    
    // An `IBOutlet` for the title label in the cell.
    @IBOutlet var titleLabel: UILabel!
    /// An `IBOutlet` for the subtitle label in the cell.
    @IBOutlet var subtitleLabel: UILabel!
    /// An `IBOutlet` for the image view in the cell.
    @IBOutlet var imageView: UIImageView!
    
    /// Called after the controller's view is loaded into memory.
    /// This method sets the corner radius of the cell to 8.
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
    }
    
    /// Configures the cell with an `Onboarding` item.
    /// - Parameter item: The `Onboarding` item to display in the cell.
    func set(item: Onboarding) {
        titleLabel.text = item.title
        subtitleLabel.text = "Lorem ipsum dolor set amet, consectetuer Lorem ipsum dolor set amet, consectetuer"
        imageView.backgroundColor = item.color
    }
}
