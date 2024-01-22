import UIKit
import Kingfisher

final class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let valueLabel = UILabel()
    private let photoImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [photoImageView, valueLabel].forEach({ addSubview($0) })
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            photoImageView.heightAnchor.constraint(equalToConstant: frame.height),
            photoImageView.widthAnchor.constraint(equalToConstant: frame.height),
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        valueLabel.text = viewModel.value

        let url = viewModel.image
        let processor = DownsamplingImageProcessor(size: CGSize(width: 50, height: 50))
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
}
