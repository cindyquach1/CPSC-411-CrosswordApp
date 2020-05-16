//
//  ViewController.swift
//  crosswords_generator
//
//  Created by Cindy Quach on 5/11/20.
//  Copyright © 2020 Cindy Quach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        screenSize = self.view.frame

        screenWidth = screenSize.width
        screenHeight = screenSize.height

        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        print(collectionView?.frame.width)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.green
        self.view.addSubview(collectionView!)
        
        
        var words = ["ASIF", "CAIRO", "CHOO", "LEIF", "ALTER", "TINE", "ERMA", "MAH", "THINS", "KNOCK", "PLEA", "AVE", "EIN", "OTS", "SLY", "ZAC", "FOP", "FIR", "IOS", "TETE", "LETAT", "ASKME", "DOM", "LOAN", "MINI", "GODNO", "SULU", "ADOS", "GREEN", "GETS", "GRE", "SORT", "SHINE", "IONS", "FOE", "GLENS", "KEN", "ADHOC", "IOR","ARM", "SKEET", "SANDWEDGE", "BOOTCAMPS", "LALALA", "EITHER", "CNN", "FAT", "REDDEN", "ATONED", "MANUP", "ISNOT","AIDE", "EGGS", "MAG", "ORA"]

        let xw_gen = CrosswordsGenerator(columns: 15, rows: 15, words: words)

        xw_gen.fillAllWords = true

        var bestResult: Array<CrosswordsGenerator.Word> = Array()
        let attempts = 10

        for _ in 0 ..< attempts {
          xw_gen.generate()
          let result = xw_gen.result
    //      print(result)

          if result.count > bestResult.count {
            bestResult.removeAll()
            for word in result {
              bestResult.append(word)
            }
          }
        }
        print(bestResult.count)
        _ = bestResult
        sleep(1000)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 82
    }

    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/9, height: screenWidth/9);

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! UICollectionViewCell
        if indexPath.row == 0
        {
            cell.backgroundColor = UIColor.lightGray

        }else
        {
            cell.backgroundColor = UIColor.white
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5

//        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
    

    
}

