import Foundation

public protocol UnitType {
    
    // MARK: - Types
    
    associatedtype Event = Never
    associatedtype Input
    associatedtype Output
}

// MARK: - Default implementation

public extension UnitType {
    typealias ViewModel = AnyViewModel<Input, Output>
    typealias EventTracker = AnyEventTracker<Event>
}
