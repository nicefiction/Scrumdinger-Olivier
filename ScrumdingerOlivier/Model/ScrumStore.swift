// MARK: - LIBRARIES
import Foundation
import SwiftUI


/// `ScrumStore` serves as the data model for your app:
class ScrumStore: ObservableObject {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Published var dailyScrums = Array<DailyScrum>.init()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    private
    static func fileURL()
    throws -> URL {
        
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    
    /// `Result` is a single type that represents the outcome of an operation,
    /// whether it’s a success or failure.
    /// The `load` function accepts a completion closure that it calls asynchronously
    /// with either an array of scrums
    /// or an error.
    static func load(completion: @escaping (Result<[DailyScrum], Error>) -> Void)
    -> Void {
        /// Dispatch queues are first in, first out (FIFO) queues
        /// to which your application can submit tasks.
        /// Background tasks have the lowest priority of all tasks.
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let _file = try? FileHandle(forReadingFrom: fileURL)
                else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                /// Decode the file’s available data into a local constant named `dailyScrums`:
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self,
                                                           from: _file.availableData)
                /// On the main queue,
                /// pass the decoded scrums to the completion handler:
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch let error {
                /// In the `catch` clause,
                /// pass the `error` to the `completion` handler:
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    static func save(scrums: [DailyScrum],
                     completion: @escaping (Result<Int, Error>) -> Void)
    -> Void {
        
        /// Encoding scrums can fail,
        /// and you’ll need to handle any errors that occur.
        /// Create a do-catch statement on a background queue:
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    static func load()
    async throws -> [DailyScrum] {
        /// Calling `withCheckedThrowingContinuation`
        /// suspends the `load` function,
        /// then passes a `continuation` into a closure that you provide.
        /// A `continuation` is a value that represents the code after an awaited function.
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error): continuation.resume(throwing: error)
                case .success(let scrums): continuation.resume(returning: scrums)
                }
            }
        }
    }
    
    
    /// The `save` function returns a value that callers of the function may not use.
    /// The `@discardableResult`attribute disables warnings about the unused return value.
    @discardableResult
    static func save(scrums: [DailyScrum])
    async throws -> Int {
        
        try await withCheckedThrowingContinuation { continuation in
            save(scrums: scrums) { result in
                switch result {
                case .failure(let error): continuation.resume(throwing: error)
                case .success(let scrumsSaved): continuation.resume(returning: scrumsSaved)
                }
            }
        }
    }
    
    

    // MARK: - HELPER METHODS
    // MARK: - INITIALIZERS
}
