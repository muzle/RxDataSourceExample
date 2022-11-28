import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class ButtonsScene: UIViewController, ViewModelBindable {
    
    // MARK: - Types
    
    typealias Unit = ButtonsSceneUnit
    typealias ViewModel = Unit.ViewModel
    
    private typealias FCell = TableViewWrapperCell<OneButtonView>
    private typealias SCell = TableViewWrapperCell<TwoButtonView>
    private typealias TCell = TableViewWrapperCell<ThreeButtonView>
    
    // MARK: - Properties
    
    var viewModel: ViewModel?
    
    // MARK: - Private properties
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .grouped)
    private let refreshControl = UIRefreshControl()
    
    private let disposeBag = DisposeBag()
    
    private var dataSource: RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {
            preconditionFailure("viewModel must be set before \(#function) call")
        }
        
        commonInit()
        bind(viewModel: viewModel)
    }
}

// MARK: - ViewModelBindable

extension ButtonsScene {
    func bind(viewModel: ViewModel) {
        let input = Unit.Input(
            update: refreshControl.rx.controlEvent(.valueChanged).asSignal().map { _ in }
        )
        let output = viewModel.transform(input: input)
        
        dataSource = RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>(
            animationConfiguration: AnimationConfiguration(reloadAnimation: .top),
            configureCell: { _, tableView, indexPath, item in
                item.cell(tableView: tableView, indexPath: indexPath)
            },
            titleForHeaderInSection: { dataSource, section in dataSource[section].header }
        )
        
        disposeBag.insert(
            output.dataSource
                .do(onNext: { [refreshControl] _ in refreshControl.endRefreshing() })
                .drive(tableView.rx.items(dataSource: dataSource))
        )
    }
}

// MARK: - Common init

extension ButtonsScene {
    func commonInit() {
        setupConstraints()
        setupViews()
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupViews() {
        tableView.run {
            $0.refreshControl = refreshControl
            $0.register(FCell.self)
            $0.register(SCell.self)
            $0.register(TCell.self)
        }
    }
}
