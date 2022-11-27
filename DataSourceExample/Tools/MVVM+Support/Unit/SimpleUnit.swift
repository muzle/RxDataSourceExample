import Foundation

public enum SimpleUnit<I, O, E>: UnitType {
    
    // MARK: - Types
    
    public typealias Event = E
    public typealias Input = I
    public typealias Output = O
}
