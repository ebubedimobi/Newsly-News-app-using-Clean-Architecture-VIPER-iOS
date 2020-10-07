//
//  SearchCollectionViewCell.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit
import SnapKit
import Kingfisher

struct SearchCellViewModel {
    let article: Article?
    let titleHeight: CGFloat
    let descriptionHeight: CGFloat
}

extension SearchCollectionViewCell {
    struct Appearance {
        let imageHeight: CGFloat = 250.0
        let seperatorHeight: CGFloat = 2.0
        let titleFont: UIFont = .boldItalic18
        let descriptionFont: UIFont = .semiboldItalic16
        let labelConstraints: CGFloat = 16.0
    }
}

class SearchCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SearchCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.article?.title
            descriptionLabel.text = viewModel.article?.description
            
            titleLabel.snp.makeConstraints { (make) in
                make.height.equalTo(viewModel.titleHeight)
            }
            
            descriptionLabel.snp.makeConstraints { (make) in
                make.height.equalTo(viewModel.descriptionHeight)
            }
            
            imageView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            setCellImage(imageUrl: viewModel.article?.urlToImage)
        }
    }
    
    private let appearance = Appearance()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = self.appearance.titleFont
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel(frame: .zero)
        description.font = self.appearance.descriptionFont
        description.numberOfLines = 0
        return description
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var view: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .darkBackground
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var seperator: UIView = {
        let seperator = UIView(frame: .zero)
        seperator.backgroundColor = .tintColor
        seperator.snp.makeConstraints { (make) in
            make.height.equalTo(appearance.seperatorHeight)
        }
        seperator.clipsToBounds = true
        return seperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        makeConstraints()
        
        // MARK: Delete this line
//        contentView.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(imageView)
        self.imageView.addSubview(view)
        view.addSubview(descriptionLabel)
        view.addSubview(titleLabel)
        view.addSubview(seperator)
    }
    
    
    private func makeConstraints() {
        descriptionLabel.snp.makeConstraints { (make) in
            make.bottom.trailing.equalTo(-appearance.labelConstraints)
            make.leading.equalTo(appearance.labelConstraints)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-appearance.labelConstraints)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-4)
            make.leading.equalTo(appearance.labelConstraints)
        }
        
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        seperator.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
    private func setCellImage(imageUrl: String?) {
        guard let imageUrl = imageUrl else { return }
        if let imageUrl = URL(string: imageUrl) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: imageUrl,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
            ])
        }
    }
}
