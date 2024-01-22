import UIKit

final class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        nameLabel.font = .systemFont(ofSize: 16)
        usernameLabel.font = .systemFont(ofSize: 14)
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.textColor = .gray
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel,emailLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelsStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.userName
        emailLabel.text = viewModel.email
    }
}
