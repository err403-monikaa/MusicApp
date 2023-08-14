//
//  HomeVC.swift
//  InterviewTask
//
//  Created by Admin on 12/08/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var track1Image: UIImageView!
    @IBOutlet weak var track2Image: UIImageView!
    @IBOutlet weak var track3Image: UIImageView!
    @IBOutlet weak var track4Image: UIImageView!
    @IBOutlet weak var track5Image: UIImageView!
    @IBOutlet weak var track6Image: UIImageView!
    @IBOutlet weak var track7Image: UIImageView!
    @IBOutlet weak var track8Image: UIImageView!
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupStyleUI()
    }
    
    func setupStyleUI() {
        let radius = track1Image.frame.height/2
        track1Image.layer.cornerRadius = radius
        track2Image.layer.cornerRadius = radius
        track3Image.layer.cornerRadius = radius
        track4Image.layer.cornerRadius = radius
        track5Image.layer.cornerRadius = radius
        track6Image.layer.cornerRadius = radius
        track7Image.layer.cornerRadius = radius
        track8Image.layer.cornerRadius = radius
        bannerImage.layer.borderWidth = 1.5
        bannerImage.layer.borderColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        bannerImage.layer.cornerRadius = 10
    }
}
