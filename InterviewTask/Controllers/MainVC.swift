//
//  MainVC.swift
//  InterviewTask
//
//  Created by Admin on 11/08/23.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var downloadBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleUI()
        //GestureRecognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickAction))
        outerView.addGestureRecognizer(tap)
        //Button Action
        downloadBtn.addTarget(self, action: #selector(onClickAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupStyleUI() {
        self.navigationController?.navigationBar.isHidden = true
        outerView.layer.cornerRadius = 20
        downloadBtn.layer.cornerRadius = downloadBtn.frame.height/2
        logoView.layer.borderWidth = 1.5
        logoView.layer.borderColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        logoView.layer.cornerRadius = 20
    }
    
    @objc func onClickAction() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}
