import UIKit
import SnapKit

class TableViewWrapperCell<ContentView: UIView>: UITableViewCell {
    
    // MARK: - Properties 
    
    lazy var cellContentView = ContentView(frame: bounds)
    
    var cellContentViewInset = UIEdgeInsets.zero {
        willSet {
            guard newValue != cellContentViewInset else { return }
            cellContentView.snp.remakeConstraints {
                $0.edges.equalToSuperview().inset(newValue)
            }
        }
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        (cellContentView as? ReactiveReusable)?.clearDisposeBag()
    }
    
    // MARK: - Private methods
    
    private func commonInit() {
        selectionStyle = .none
        contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(cellContentViewInset)
        }
    }
}

// MARK: - ViewModelBindable

extension TableViewWrapperCell: ViewModelBindable where ContentView: ViewModelBindable {
    
    // MARK: - Type
    
    typealias ViewModel = ContentView.ViewModel
    
    // MARK: - Protocol methods
    
    func bind(viewModel: ViewModel) {
        cellContentView.bind(viewModel: viewModel)
    }
}
