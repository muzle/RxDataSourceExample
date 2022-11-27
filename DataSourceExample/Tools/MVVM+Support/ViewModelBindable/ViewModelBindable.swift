import Foundation

public protocol ViewModelBindable {
    
    // MARK: - Types
    
    associatedtype ViewModel
    
    // MARK: - Methods
    
    func bind(viewModel: ViewModel)
}
