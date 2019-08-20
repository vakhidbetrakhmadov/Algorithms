import Foundation 

/// Return all matches of the collection (pattern) in the collection, or empty array if no matches are found.
/// Time: O(N*M), where N is the legth of self, and M is the length of the given collection (pattern).
/// Space O(1)
public extension Collection where Element: Equatable {
    func allIndices(of collection: Self) -> [Index] {
        guard !collection.isEmpty && collection.endIndex <= endIndex else { return [] }

        var result: [Index] = []
        
        outer: for i in indices.prefix(count - collection.count + 1) {
            guard self[i] == collection[collection.startIndex] else { continue }

            for (i, j) in zip(indices[i...], collection.indices) {
                guard self[i] == collection[j] else { continue outer }
            }

            result.append(i)
        }

        return result
    }
}

func assertAllIndices<C: Collection>(of pattern: C, in source: C, is result: [Int]) where C.Element: Equatable {
    let allIndices = source.allIndices(of: pattern).map { source.distance(from: source.startIndex, to: $0) }
    // print(allIndices)
    assert(allIndices == result)
}