//
//  InputDatasCollectionView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

class InputDatasCollectionView: UICollectionView {
    var charactersCount: Int? {
        didSet {
            self.reloadData()
        }
    }
    weak var actionDelegate: InputDatasView?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup(){
        register(cellType: InputDatasCollectionViewCell.self)
        dataSource = self
        delegate = self
        reloadData()
    }
    
    func cellHeight(count: Int) -> CGFloat{
        return CGFloat(count * 40)
    }
}

extension InputDatasCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: cellHeight(count: charactersCount ?? 0) + 180.0)
    }
    
}

extension InputDatasCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: InputDatasCollectionViewCell.self, for: indexPath)
        cell.characterCount = self.charactersCount ?? 0
        cell.generateTextField()
        cell.delegate = self
        return cell
    }
}

extension InputDatasCollectionView: InputDatasCellDelegate{
    func cellDidSelectCalcurate(_ view: UICollectionViewCell, datas: [String : Int]) {
        actionDelegate?.inputDatasView(view, datas: datas)
    }
}



