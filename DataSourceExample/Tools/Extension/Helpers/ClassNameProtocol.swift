import Foundation

public protocol ClassNameProtocol {
    
    // MARK: - Static properties
    
    static var className: String { get }
    
    // MARK: - Properties
    
    var className: String { get }
}

// MARK: - Default implementation

public extension ClassNameProtocol {
    static var className: String {
        String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

// MARK: - NSObject + ClassNameProtocol

extension NSObject: ClassNameProtocol { }
