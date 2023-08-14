//
//  ReadyToPlayVC.swift
//  InterviewTask
//
//  Created by Admin on 12/08/23.
//

import UIKit

class ReadyToPlayVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var playlistStackView: UIStackView!
    @IBOutlet weak var firstPlaylistView: UIView!
    @IBOutlet weak var secondPlaylistView: UIView!
    @IBOutlet weak var thirdPlaylistView: UIView!
    @IBOutlet weak var walletView: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    
    weak var delegate: BottomNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleUI()
        //Button Action
        confirmBtn.addTarget(self, action: #selector(onTapConfirm), for: .touchUpInside)
        //GestureRecognizer
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tap)
    }
    
    func setupStyleUI() {
        confirmBtn.layer.borderWidth = 1.5
        confirmBtn.layer.borderColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        confirmBtn.layer.cornerRadius = confirmBtn.frame.height/2
        firstPlaylistView.layer.borderWidth = 0.5
        firstPlaylistView.layer.borderColor = UIColor.white.cgColor
        firstPlaylistView.layer.cornerRadius = firstPlaylistView.frame.height/2
        firstPlaylistView.layer.masksToBounds = true
        secondPlaylistView.layer.borderWidth = 0.5
        secondPlaylistView.layer.borderColor = UIColor.white.cgColor
        secondPlaylistView.layer.cornerRadius = secondPlaylistView.frame.height/2
        secondPlaylistView.layer.masksToBounds = true
        thirdPlaylistView.layer.borderWidth = 0.5
        thirdPlaylistView.layer.borderColor = UIColor.white.cgColor
        thirdPlaylistView.layer.cornerRadius = thirdPlaylistView.frame.height/2
        thirdPlaylistView.layer.masksToBounds = true
    }
    
    @objc func onTapConfirm() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    @objc func backgroundViewTapped() {
        self.dismiss(animated: true)
    }
}



