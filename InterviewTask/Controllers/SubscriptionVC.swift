//
//  SubscriptionVC.swift
//  InterviewTask
//
//  Created by Admin on 12/08/23.
//

import UIKit

class SubscriptionVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subscriptionStackView: UIStackView!
    @IBOutlet weak var freeView: UIView!
    @IBOutlet weak var premiumView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    weak var delegate: BottomNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleUI()
        //Button Action
        nextBtn.addTarget(self, action: #selector(onClickNextBtn), for: .touchUpInside)
        
        //GestureRecognizer
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func backgroundViewTapped() {
        self.dismiss(animated: true)
    }
    
    func setupStyleUI() {
        nextBtn.layer.borderWidth = 1.5
        nextBtn.layer.borderColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        freeView.layer.borderWidth = 0.5
        freeView.layer.borderColor = UIColor.white.cgColor
        freeView.layer.cornerRadius = 10
        premiumView.layer.borderWidth = 0.5
        premiumView.layer.borderColor = UIColor.white.cgColor
        premiumView.layer.cornerRadius = 10
    }
    
    @objc func onClickNextBtn() {
        self.dismiss(animated: true) 
        self.delegate?.navigateVC(vc: .secondVC)
    }
}

