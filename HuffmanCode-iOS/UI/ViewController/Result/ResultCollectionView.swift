//
//  ResultCollectionView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/03.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit
protocol ContentsViewDelegate:class {
    func contentsView(_ view: UICollectionViewCell, onEvent: ResultToolsEvent)
}

class ResultCollectionView: UICollectionView {
    weak var contentsDelegate: ContentsViewDelegate?
    
    var data: [String: Int]?
    var huffman: HuffmanCode?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepare()
    }
    
    private func prepare(){
        dataSource = self
        delegate = self
        register(cellTypes: [ResultContentsCollectionViewCell.self,ResultToolsCollectionViewCell.self])
        reloadData()
    }
}

extension ResultCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: UIScreen.main.bounds.width, height: 205)
        }else {
            return CGSize(width: UIScreen.main.bounds.width, height: 60)
        }
    }
}

extension ResultCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 { return 1 }
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(with: ResultContentsCollectionViewCell.self, for: indexPath)
            guard let h = huffman else { return cell }
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(with: ResultToolsCollectionViewCell.self, for: indexPath)
            cell.toolsDelegate = self
            return cell
        }
        
    }
}

extension ResultCollectionView: ResultToolsViewDelegate {
    func toolsView(_ view: UICollectionViewCell, onEvent: ResultToolsEvent) {
        contentsDelegate?.contentsView(view, onEvent: onEvent)
    }
}

