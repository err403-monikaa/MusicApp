//
//  PremiumSubscriptionVC.swift
//  InterviewTask
//
//  Created by Admin on 12/08/23.
//

import UIKit

class PremiumSubscriptionVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var pointsStackView: UIStackView!
    @IBOutlet weak var firstPointView: UIView!
    @IBOutlet weak var secondPointView: UIView!
    @IBOutlet weak var thirdPointView: UIView!
    @IBOutlet weak var walletView: UIView!
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
    
    func setupStyleUI() {
        let appColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        nextBtn.layer.borderWidth = 1.5
        nextBtn.layer.borderColor = appColor
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        firstPointView.layer.borderWidth = 1.5
        firstPointView.layer.borderColor = appColor
        firstPointView.layer.cornerRadius = firstPointView.frame.height/2
        secondPointView.layer.borderWidth = 1.5
        secondPointView.layer.borderColor = appColor
        secondPointView.layer.cornerRadius = secondPointView.frame.height/2
        thirdPointView.layer.borderWidth = 1.5
        thirdPointView.layer.borderColor = appColor
        thirdPointView.layer.cornerRadius = thirdPointView.frame.height/2
    }
    
    @objc func onClickNextBtn() {
        self.dismiss(animated: true)
        self.delegate?.navigateVC(vc: .ThirdVC)
    }
    
    @objc func backgroundViewTapped() {
        self.dismiss(animated: true)
    }

}


