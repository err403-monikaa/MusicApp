//
//  PreviewVC.swift
//  InterviewTask
//
//  Created by Admin on 11/08/23.
//

import UIKit

enum BottomVC: String {
   case firstVC = "SubscriptionVC"
   case secondVC = "PremiumSubscriptionVC"
   case ThirdVC = "ReadyToPlayVC"
}

protocol BottomNavigationDelegate: NSObject {
    func navigateVC(vc: BottomVC)
}

class PreviewVC: UIViewController {
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readMoreBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topBtnView: UIView!
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var bottomBtnView: UIView!
    @IBOutlet weak var bottomCloseBtn: UIButton!
    @IBOutlet weak var progressBtn: ButtonProgressBar!
    
    let kConstant = 5
    var previewImages = ["banner-1", "banner-2", "banner-3", "banner-4", "banner-5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStyleUI()
        
        //Button Action
        closeBtn.addTarget(self, action: #selector(onClickCloseBtn), for: .touchUpInside)
        topBtn.addTarget(self, action: #selector(topBtnTapped), for: .touchUpInside)
        progressBtn.addTarget(self, action: #selector(progressBtnTapped), for: .touchUpInside)
        bottomCloseBtn.addTarget(self, action: #selector(bottomCloseBtnTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PreviewCVCell", bundle: nil), forCellWithReuseIdentifier: "PreviewCVCell")
    }
    
    func setupStyleUI() {
        let appColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        let secondaryAppColor = UIColor(red: 28/255, green: 219/255, blue: 99/255, alpha: 1)
        logoView.layer.borderWidth = 1.5
        logoView.layer.borderColor = appColor
        logoView.layer.cornerRadius = 20
        readMoreBtn.isEnabled = false
        bottomBtnView.isHidden = true
        topBtn.layer.cornerRadius = 25
        topBtn.setTitle("DOWNLOAD", for: .normal)
        bottomCloseBtn.layer.cornerRadius = bottomCloseBtn.frame.height/2
        progressBtn.layer.cornerRadius = 25
        progressBtn.backgroundColor = secondaryAppColor
        progressBtn.setTitleColor(UIColor.black, for: .normal)
        progressBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
//        if topBtn.currentTitle == "DOWNLOAD" {
            topBtn.backgroundColor = secondaryAppColor
            topBtn.setTitleColor(UIColor.black, for: .normal)
//        }
//        else {
            
//        }
    }
    
    func getController(vc: BottomVC) -> UIViewController {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: vc.rawValue) else { return UIViewController() }
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        return controller
    }
    
    @objc func onClickCloseBtn() {
        self.dismiss(animated: true)
    }
    
    @objc func topBtnTapped() {
        if topBtn.currentTitle == "DOWNLOAD" {
            bottomBtnView.isHidden = false
            topBtnView.isHidden = true
        }
        else {
            if let vc = getController(vc: .firstVC) as? SubscriptionVC {
                vc.delegate = self
                self.present(vc, animated: true)
            }
        }
    }

    @objc func bottomCloseBtnTapped() {
        bottomBtnView.isHidden = true
        topBtnView.isHidden = false
        topBtn.setTitle("DOWNLOAD", for: .normal)
    }
    
    @objc func progressBtnTapped() {
        let progressColor = UIColor(red: 28/255, green: 219/255, blue: 99/255, alpha: 1)
        progressBtn.setBackgroundColor(color: progressColor.withAlphaComponent(0.6))
        progressBtn.setProgressColor(color: progressColor)
        progressBtn.startIndeterminate(withTimePeriod: 10, andTimePadding: 0.1)
        progressBtn.setTitle("DOWNLOADING", for: .normal)
        self.loadDeterminate()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10), execute: {
            self.activatePlayBtn()
        })
    }
    
    func loadDeterminate() {
        progressBtn.stopIndeterminate()
    }
    
    func activatePlayBtn() {
        self.bottomBtnView.isHidden = true
        self.topBtnView.isHidden = false
        self.topBtn.setTitle("PLAY", for: .normal)
        self.topBtn.layer.borderWidth = 1.5
        self.topBtn.layer.borderColor = UIColor(red: 37/255, green: 104/255, blue: 56/255, alpha: 1).cgColor
        self.topBtn.backgroundColor = UIColor.black
        let titleColor = UIColor(red: 28/255, green: 219/255, blue: 99/255, alpha: 1)
        self.topBtn.setTitleColor(titleColor, for: .normal)
    }
}

extension PreviewVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kConstant
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCVCell", for: indexPath) as! PreviewCVCell
        cell.previewImage.image = UIImage(named: previewImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        let height = collectionView.frame.height - 60
        return CGSize(width: width, height: height)
    }
    
}

extension PreviewVC: BottomNavigationDelegate {
    func navigateVC(vc: BottomVC) {
        switch vc {
        case .firstVC:
            break
        case .secondVC:
            if let vc = getController(vc: .secondVC) as? PremiumSubscriptionVC {
                vc.delegate = self
                self.present(vc, animated: true)
            }
        case .ThirdVC:
            if let vc = getController(vc: .ThirdVC) as? ReadyToPlayVC {
                self.present(vc, animated: true)
            }
        }
    }
}
