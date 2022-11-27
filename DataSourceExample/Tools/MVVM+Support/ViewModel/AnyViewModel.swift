import Foundation

public final class AnyViewModel<Input, Output>: ViewModelType {
    
    // MARK: - Private properties
    
    private let transformation: (Input) -> Output
    
    // MARK: - Initialization
    
    public init<Model: ViewModelType>(_ model: Model) where Model.Input == Input, Model.Output == Output {
        transformation = model.transform(input:)
    }
    
    // MARK: - Protocol methods
    
    public func transform(input: Input) -> Output {
        transformation(input)
    }
}
