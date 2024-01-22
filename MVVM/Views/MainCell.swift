import UIKit
import Kingfisher

final class MainCell: UICollectionViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    // MARK: - Private properties
    private let valueLabel = UILabel()
    private let photoImageView = UIImageView()
    private let backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupCell(viewModel: MainCellViewModel) {
        valueLabel.text = viewModel.value

        let url = viewModel.image
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
    
    // MARK: - Private methods
    private func setupView() {
        photoImageView.layer.cornerRadius = 20
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.layer.cornerRadius = 20
        backView.clipsToBounds = true
        backView.backgroundColor = .black
        backView.alpha = 0.2
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.textAlignment = .center
        valueLabel.font = .boldSystemFont(ofSize: 17)
        valueLabel.textColor = .white
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [photoImageView, backView, valueLabel].forEach({ addSubview($0) })
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor),
            photoImageView.rightAnchor.constraint(equalTo: rightAnchor),
            
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backView.leftAnchor.constraint(equalTo: leftAnchor),
            backView.rightAnchor.constraint(equalTo: rightAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            valueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            valueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        ])
    }
}
