//
//  ViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 21.10.2022.
//

import UIKit

protocol OnBoardingViewProtocol: AnyObject {
    func configureCollectionView()
}

final class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    private let onBoardingViewModel = OnBoardingViewModel()
    
    var slides: [OnBoardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = self.currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }
            else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingViewModel.view = self
        onBoardingViewModel.viewDidLoad()
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            
            present(controller, animated: true, completion: nil)
        }
        else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
        
    }
    
}

extension OnBoardingViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCell.identifier, for: indexPath) as! OnBoardingCell
        
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
    
}

extension OnBoardingViewController: OnBoardingViewProtocol {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [OnBoardingSlide(title: "Hello", description: "My Name is Bedirhan", image: UIImage(named: "logo")!),
                  OnBoardingSlide(title: "Welcome", description: "To my App", image: UIImage(named: "imdb")!),
                  OnBoardingSlide(title: "Who wants to be a", description: "Millionaire", image: UIImage(named: "raining")!)
        ]
    }
}

