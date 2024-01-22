import UIKit

class DetailsViewController: UIViewController {
    
    private let valueLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let photoImageView = UIImageView()
    
    private var labelsStackView = UIStackView()
    
    let detailsViewModel: DetailsViewModel
    
    init(_ detailViewModel: DetailsViewModel) {
        self.detailsViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        displayWordInfo()
//        loadImage()
    }
    
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
        
        
        view.addSubview(photoImageView)
        view.addSubview(labelsStackView)
    }
    
    private func displayWordInfo() {
        valueLabel.text = detailsViewModel.value
        descriptionLabel.text = detailsViewModel.description
        loadImage()
    }
    
    private func loadImage() {
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
            
            labelsStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            labelsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            labelsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
