//
//  DetailsNews.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 28/3/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class DetailsNews: UIViewController {
    
    func configure(with: Article) {
        self.titleLabel.text = with.title
        self.textLabel.text = with.description
        self.authorText.text = with.author
        handleImage(url: with.urlToImage!)
    }
    
    private func handleImage(url: String) {
        let url = URL(string: url)
        self.imgNews.kf.setImage(with: url)
    }

    let titleLabel: UILabel = {
        let titleL = UILabel()
        titleL.numberOfLines = 0
        titleL.font = .boldSystemFont(ofSize: 16)
        return titleL
    }()
    
    let textLabel: UILabel = {
        let textL = UILabel()
        textL.numberOfLines = 0
        textL.font = .systemFont(ofSize: 13)
        return textL
    }()
    
    let authorText: UILabel = {
        let author = UILabel()
        author.numberOfLines = 0
        author.font = .systemFont(ofSize: 13)
        return author
    }()
    
    let imgNews: UIImageView = {
        let imgN = UIImageView()
        imgN.layer.masksToBounds = true
        imgN.clipsToBounds = true
        return imgN
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllObject()
        settingsContraint()
        view.backgroundColor = .white
        title = "Detailed News"
    }
    
    func addAllObject(){
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(imgNews)
        view.addSubview(authorText)
    }
    
    func settingsContraint(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(16)
        }
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
        }
        
        imgNews.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(30)
            make.height.equalTo(200)
            make.left.right.equalToSuperview().inset(16)
        }
        
        imgNews.layer.cornerRadius = 20
        
        authorText.snp.makeConstraints { make in
            make.top.equalTo(imgNews.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(16)
        }
    }
}
