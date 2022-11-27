import Foundation

public protocol ViewModelType {
    
    // MARK: - Types
    
    associatedtype Unit: UnitType = SimpleUnit<Input, Output, Never> where Unit.Input == Input, Unit.Output == Output
    associatedtype Input
    associatedtype Output
    
    // MARK: - Methods
    
    func transform(input: Input) -> Output
}

// MARK: - Default implementation

public extension ViewModelType {
    func asAnyViewModel() -> AnyViewModel<Input, Output> {
        AnyViewModel<Input, Output>(self)
    }
}
