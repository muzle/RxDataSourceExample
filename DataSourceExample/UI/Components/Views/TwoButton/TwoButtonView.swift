import UIKit
import RxSwift
import RxCocoa

class TwoButtonView: UIView, ViewModelBindable {
    
    // MARK: - Constants
    
    private enum Constants {
        static let stackViewSpacing = CGFloat(16)
        static let buttonsStackViewSpacing = CGFloat(8)
        static let contentInset = UIEdgeInsets.zero
        static let buttonCornerRadius = CGFloat(4)
    }
    
    // MARK: - Types
    
    typealias Unit = TwoButtonUnit
    typealias ViewModel = Unit.ViewModel
    
    // MARK: - Private properties
    
    private let label = UILabel()
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    
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

private extension TwoButtonView {
    func commonInit() {
        setupConstraints()
        setupViews()
    }
    
    func setupConstraints() {
        let buttonsStackView = UIStackView(arrangedSubviews: [firstButton, secondButton]).apply {
            $0.axis = .horizontal
            $0.spacing = Constants.buttonsStackViewSpacing
        }
        let stackView = UIStackView(arrangedSubviews: [label, buttonsStackView]).apply {
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
        
        [firstButton, secondButton].forEach {
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = Constants.buttonCornerRadius
        }
    }
}

// MARK: - ViewModelBindable

extension TwoButtonView {
    func bind(viewModel: ViewModel) {
        let input = Unit.Input(
            first: firstButton.rx.tap.asSignal(),
            second: secondButton.rx.tap.asSignal()
        )
        let output = viewModel.transform(input: input)
        
        disposeBag.insert(
            output.title.drive(label.rx.text),
            output.firstButtonTitle.drive(firstButton.rx.title()),
            output.secondButtonTitle.drive(secondButton.rx.title()),
            output.empty.emit()
        )
    }
}

// MARK: - ReactiveReusable

extension TwoButtonView: ReactiveReusable {
    func clearDisposeBag() {
        disposeBag = DisposeBag()
    }
}
