//
//  TopTVC.swift
//  AmazonPrime
//
//  Created by Arpit Srivastava on 27/02/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class TopTVC: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectnView:UICollectionView!
    @IBOutlet weak var pageControl:UIPageControl!
    var offset:CGFloat = 0.0
    var currentpage:Int?
    var timer:Timer!
    var images :[UIImage] = [UIImage(named:"LBogan")!,UIImage(named:"LCivilwar")!,UIImage(named:"LDarkknight")!,UIImage(named:"LHaider")!,UIImage(named:"LIronman")!,UIImage(named:"LLegion")!]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectnView.delegate=self
        collectnView.dataSource=self
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    @IBAction func onClickAction(_ sender: UIPageControl) {
        self.currentpage = sender.currentPage
        self.pageChanged()
    }
}
extension TopTVC{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCVCCollectionViewCell", for: indexPath) as? TopCVCCollectionViewCell
        let pageCount : CGFloat = CGFloat(images.count)
        collectionView.isPagingEnabled = true
        pageControl.numberOfPages = Int(pageCount)
        pageControl.currentPageIndicatorTintColor = UIColor.yellow
        pageControl.pageIndicatorTintColor=UIColor.white
        cell?.imageVier.image=images[indexPath.item]
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
        
    }
    @objc func pageChanged() {
        let pageNumber = pageControl.currentPage
        var frame = collectnView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        collectnView.scrollRectToVisible(frame, animated: true)
    }
    
    //MARK: Timmer logic to autoscroll the collection view
    @objc func scrollAutomatically(_ timer1: Timer) {
        if let coll  = collectnView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < images.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
            }
        }
    }
    //MARK: Another approach for using timer as delay with animations
    @objc func autoScroll() {
        let totalPossibleOffset = CGFloat(images.count - 1) * self.collectnView.bounds.size.width
        if offset == totalPossibleOffset {
            offset = 0
        } else {
            print(offset)
            offset = offset + self.collectnView.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.collectnView.contentOffset.x = CGFloat(self.offset)
            }, completion: nil)
        }
    }
}



