import UIKit
import RxSwift
import RxCocoa

class OneButtonView: UIView, ViewModelBindable {
    
    // MARK: - Constants
    
    private enum Constants {
        static let stackViewSpacing = CGFloat(16)
        static let contentInset = UIEdgeInsets.zero
        static let buttonCornerRadius = CGFloat(4)
    }
    
    // MARK: - Types
    
    typealias Unit = OneButtonUnit
    typealias ViewModel = Unit.ViewModel
    
    // MARK: - Private properties
    
    private let label = UILabel()
    private let button = UIButton()
    
    private var disposeBag = DisposeBag()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

// MARK: - Common init

private extension OneButtonView {
    func commonInit() {
        setupConstraints()
        setupViews()
    }
    
    func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [label, button]).apply {
            $0.axis = .vertical
            $0.spacing = Constants.stackViewSpacing
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.contentInset)
        }
    }
    
    func setupViews() {
        label.run {
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
        
        button.run {
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = Constants.buttonCornerRadius
        }
    }
}

// MARK: - ViewModelBindable

extension OneButtonView {
    func bind(viewModel: ViewModel) {
        let input = Unit.Input(
            first: button.rx.tap.asSignal()
        )
        let output = viewModel.transform(input: input)
        
        disposeBag.insert(
            output.title.drive(label.rx.text),
            output.buttonTitle.drive(button.rx.title()),
            output.empty.emit()
        )
    }
}

// MARK: - ReactiveReusable

extension OneButtonView: ReactiveReusable {
    func clearDisposeBag() {
        disposeBag = DisposeBag()
    }
}
