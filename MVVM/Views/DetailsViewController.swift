import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Private properties
    private let valueLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let photoImageView = UIImageView()
    private var labelsStackView = UIStackView()
    
    private let sharedButton = UIButton()
    
    let detailsViewModel: DetailsViewModel
    
    // MARK: - Init
    init(_ detailViewModel: DetailsViewModel) {
        self.detailsViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        displayWordInfo()
    }
    
    override func viewDidLayoutSubviews() {
        sharedButton.layer.cornerRadius = sharedButton.frame.width / 2
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .white
        valueLabel.font = .italicSystemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
        
        labelsStackView = UIStackView(arrangedSubviews: [valueLabel, descriptionLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        photoImageView.layer.cornerRadius = 20
        photoImageView.clipsToBounds = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        sharedButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        sharedButton.backgroundColor = .secondarySystemBackground
        sharedButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        sharedButton.translatesAutoresizingMaskIntoConstraints = false
        
        [photoImageView, labelsStackView, sharedButton].forEach({ view.addSubview($0) })
    }
    
    private func displayWordInfo() {
        valueLabel.text = detailsViewModel.value
        descriptionLabel.text = detailsViewModel.description
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: self.detailsViewModel.image),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.photoImageView.image = image
                }
            }
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            photoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            sharedButton.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 10),
            sharedButton.rightAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: -10),
            sharedButton.heightAnchor.constraint(equalToConstant: 35),
            sharedButton.widthAnchor.constraint(equalToConstant: 35),
            
            labelsStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            labelsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            labelsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    @objc private func shareButtonTapped() {
        guard let picture = photoImageView.image else { return }
        
        let activityViewController = UIActivityViewController(
            activityItems: [picture],
            applicationActivities: nil
        )
        present(activityViewController, animated: true)
    }
}
