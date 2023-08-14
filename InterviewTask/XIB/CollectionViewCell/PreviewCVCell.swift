//
//  PreviewCVCell.swift
//  InterviewTask
//
//  Created by Admin on 11/08/23.
//

import UIKit

class PreviewCVCell: UICollectionViewCell {
    
    @IBOutlet weak var previewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        previewImage.layer.cornerRadius = 10
    }
}
