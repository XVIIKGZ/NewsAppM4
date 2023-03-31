//
//  NewsViewCell.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 30/3/23.
//

import UIKit
import Foundation
import Kingfisher
import SnapKit

class NewsViewCell: UITableViewCell {
    
    static let idCell = "NewsViewCell"
    
    private lazy var titleNews: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    }()
    
    private lazy var descriptionNews: UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 10)
        description.numberOfLines = 5
        return description
    }()
    
    private lazy var authorNews: UILabel = {
        let author = UILabel()
        author.font = .boldSystemFont(ofSize: 5)
        author.textAlignment = .justified
        return author
    }()
    
    private lazy var imageNews: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var divinderView: UIView = {
        let divinder = UIView()
        divinder.backgroundColor = .black
        return divinder
    }()
    
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    
    func setupConstraints(){
        
        self.addSubview(titleNews)
        titleNews.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-20)
        }
        
        self.addSubview(imageNews)
        imageNews.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.right.bottom.equalToSuperview().inset(8)
            make.width.height.equalTo(140)
        }
        
        imageNews.layer.cornerRadius = 20
        
        self.addSubview(descriptionNews)
        descriptionNews.snp.makeConstraints { make in
            make.centerY.equalTo(imageNews.snp.centerY)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageNews.snp.left).offset(-20)
        }
        
        self.addSubview(divinderView)
        divinderView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(0.5)
        }
        
        self.addSubview(authorNews)
        authorNews.snp.makeConstraints { make in
            make.right.equalTo(imageNews.snp.left).offset(-20)
            make.top.equalTo(descriptionNews.snp.bottom).offset(15)
        }
    }
    
    func configure(with: Article) {
        self.titleNews.text = with.title
        self.descriptionNews.text = with.description
        self.authorNews.text = with.author
        handleImage(url: with.urlToImage!)
    }
    
    private func handleImage(url: String) {
        let url = URL(string: url)
        self.imageNews.kf.setImage(with: url)
    }
   
    
}
