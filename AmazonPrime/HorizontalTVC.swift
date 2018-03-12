//
//  HorizontalTVC.swift
//  AmazonPrime
//
//  Created by Appinventiv Mac on 27/02/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class HorizontalTVC: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectnView:UICollectionView!
//    var images :[UIImage] = [UIImage(named:"PAssassin'screed")!,UIImage(named:"PAvengers")!,UIImage(named:"PBattleship")!,UIImage(named:"PDeadpool")!,UIImage(named:"PHobbit")!,UIImage(named:"PJusticeleague")!,UIImage(named:"PMadmax")!,UIImage(named:"PSpyder")!]
    var images = ["PAssassin'screed","PAvengers","PBattleship","PDeadpool","PHobbit","PJusticeleague","PMadmax","PSpyder","s1"] //9
    var rows,sect:Int!
    var watchNextImages  = ["1","2","3","4","5","6"] //6
    var seasonssImages = ["s1","s2","s3","s4","s4","s5","s6","s7","s8","s9","s10"]  //10
    var sportsImages = ["sp1","sp2","sp3","sp4","sp5","sp6","sp7"]  //7
    var latestImages = ["m1","m2","m3","m4","m5","m6","m7","m8"]  //8 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectnView.dataSource=self
        collectnView.delegate=self
        collectnView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension HorizontalTVC {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if rows == 2 {
            return watchNextImages.count
        }else if rows == 4 {
            return latestImages.count
        }else if rows == 6{
            return seasonssImages.count
        }else if rows == 8 {
            return images.count
        }else {
            return sportsImages.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if rows == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCVC", for: indexPath) as? HorizontalCVC
            cell?.imageView.image=UIImage(named:watchNextImages[indexPath.row])
            return cell!
        }else if rows == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCVC", for: indexPath) as? HorizontalCVC
            cell?.imageView.image=UIImage(named:latestImages[indexPath.row])
            return cell!
        }else if rows == 6{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCVC", for: indexPath) as? HorizontalCVC
            cell?.imageView.image=UIImage(named:seasonssImages[indexPath.row])
            return cell!
        }else if rows == 8 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCVC", for: indexPath) as? HorizontalCVC
            cell?.imageView.image=UIImage(named:images[indexPath.row])
            return cell!
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCVC", for: indexPath) as? HorizontalCVC
            cell?.imageView.image=UIImage(named:sportsImages[indexPath.row])
            return cell!
        }
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        if indexPath.item == 1 || indexPath.item == 4 || indexPath.item == 7 || indexPath.item == 10 {
          return CGSize(width: width/2, height: height)
        }else{
        return CGSize(width: width/3.5, height: height)
    }
    }
    
}
