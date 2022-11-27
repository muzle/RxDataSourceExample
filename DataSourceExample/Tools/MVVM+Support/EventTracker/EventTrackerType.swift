import Foundation

public protocol EventTrackerType {
    
    // MARK: - Types
    
    associatedtype Event
    
    // MARK: - Methods
    
    func handle(event: Event)
}

// MARK: - Default implementation

public extension EventTrackerType {
    func asEventTracker() -> AnyEventTracker<Event> {
        AnyEventTracker<Event>(self)
    }
}
